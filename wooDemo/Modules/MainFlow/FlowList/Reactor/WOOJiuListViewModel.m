//
//  WOOJiuListViewModel.m
//  wooDemo
//
//  Created by colr on 2018/11/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOJiuListViewModel.h"
#import "WOOLoginService.h"
#import "WOOMainFlowListApi.h"
#import "WOOUserDeviceModel.h"
#import "WOOGoodsModel.h"

@interface WOOJiuListViewModel()

@property (strong, nonatomic)NSArray<WOOJiuListDemoModel *> * dataList;

@property (strong, nonatomic)RACSubject *errorSubject;

@property (strong, nonatomic)NSString * mainApiHost;

@property (strong, nonatomic)NSMutableArray * mainModelArray;

@end

@implementation WOOJiuListViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.errorSubject = [RACSubject subject];
        [self initWithTheApiListCompletion:^(BOOL finish) {
            if (finish) {
                [self fetchMainFlowListWithRefreshType:WOORefreshTypeHeader];
            }
        }];
    }
    return self;
}

- (void)initWithTheApiListCompletion:(void(^)(BOOL finish))completion {
    NSDictionary * dic = [NSDictionary dictionary];
    [WOOLoginService initNewUserWithDictionary:dic completion:^(BOOL isSuccess,NSError *error) {
        if (isSuccess) {
            [WOOLoginService getTheSteamServiceListWithDictionary:dic completion:^(NSArray<WOOApiHostModel *> * apiModelArr, NSError * error) {
                if (!error) {
                    //配置ApiList
                    for (WOOApiHostModel * apiModel in apiModelArr) {
                        if (apiModel.pattern.length > 0) {
                            if ([apiModel.pattern hasPrefix:@"http://"]) {
                                self.mainApiHost = apiModel.pattern;
                            }else{
                                self.mainApiHost = FORMAT(@"http://%@",apiModel.pattern);
                            }
                            break;
                        }
                    }
                    completion(YES);
                }
            }];
        }
    }];
}

- (void)fetchMainFlowListWithRefreshType:(WOORefreshType)refreshType {
    if (!self.mainApiHost) {return;}
    WOOUserDeviceModel * model = [[WOOUserDeviceModel alloc]init];
    NSDictionary * pramDic = [model streamListDictionary];
    switch (refreshType) {
        case WOORefreshTypeHeader:
            [self refreshTheDataWithPramdic:pramDic];
            break;
        case WOORefreshTypeFooter:
            [self loadMoreDataWithPramdic:pramDic];
        default:
            break;
    }
}

#pragma mark- 下拉刷新
- (void)refreshTheDataWithPramdic:(NSDictionary *)pramDic {
    [self.mainModelArray removeAllObjects];
    @weakify(self)
    [WOOMainFlowListApi getTheMainFlowListWithPath:self.mainApiHost
                                        Dictionary:pramDic
                                        completion:^(WOOMainFlowModel * _Nonnull model, NSError * _Nonnull error) {
                                            @strongify(self)
                                            if (model) {
                                                [self.mainModelArray addObject:model];
                                                [WOOMainFlowListApi getTheMainFlowListWithPath:self.mainApiHost Dictionary:pramDic completion:^(WOOMainFlowModel * _Nonnull model, NSError * _Nonnull error) {
                                                    @strongify(self)
                                                    if (model) {
                                                        [self.mainModelArray addObject:model];
                                                        [self configTheArrData:self.mainModelArray];
                                                    }else{
                                                        [self.errorSubject sendNext:@"error"];
                                                    }
                                                }];
                                            }else{
                                                [self.errorSubject sendNext:@"error"];
                                            }
                                        }];
}

#pragma mark- 上拉加载更多（其实也是刷新）
- (void)loadMoreDataWithPramdic:(NSDictionary *)pramDic {
    @weakify(self)
    [WOOMainFlowListApi getTheMainFlowListWithPath:self.mainApiHost Dictionary:pramDic completion:^(WOOMainFlowModel * _Nonnull model, NSError * _Nonnull error) {
        @strongify(self)
        if (model) {
            [self.mainModelArray addObject:model];
            [self configTheArrData:self.mainModelArray];
        }else{
            [self.errorSubject sendNext:@"error"];
        }
    }];
}


- (void)configTheArrData:(NSMutableArray *)mainDataArr {
    NSMutableArray * modelArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * dataArr = [NSMutableArray arrayWithCapacity:0];
    for (WOOMainFlowModel * mModel in mainDataArr) {
        WOOMainFlowModel * mainModel = [[WOOMainFlowModel alloc]initWithDictionary:[mModel toDictionary]];
        for (WOOArticleModel * articleModel in mainModel.articleArray) {
            [modelArr addObject:articleModel];
        }
    }
//从这里都转化为article model数组
    NSInteger x = modelArr.count / 7;
    for (int i = 0; i < x; i++) {
        WOOJiuListDemoModel * listModel = [[WOOJiuListDemoModel alloc]init];
        NSMutableArray * mutableArr = [NSMutableArray arrayWithCapacity:0];
        NSMutableArray * bottomMArr = [NSMutableArray arrayWithCapacity:0];
        for (int j = 0; j < 8; j++) {
            int index = i * 8 + j;
            //从这里插入一个商品model
            if (j == 2) {
                WOOGoodsModel * goodsModel = [self createAGoodsModel];
                [modelArr insertObject:goodsModel atIndex:index];
            }
            if (index < modelArr.count) {
                WOOArticleModel * model = modelArr[index];
                if (j == 0) {
                    listModel.firstModel = model;
                }
                if (j > 0 && j < 4) {
                    if (j == 2) {
                        WOOGoodsModel * goodsModel = modelArr[index];
                        [mutableArr addObject:goodsModel];
                    }else{
                        [mutableArr addObject:model];
                    }
                }else if(j > 3 && j < 7){
                    [bottomMArr addObject:model];
                }
                if (j == 7) {
                    listModel.lastModel = model;
                }
            }
        }
        listModel.dataArray = mutableArr;
        listModel.bottomArray = bottomMArr;
        [dataArr addObject:listModel];
    }
    
    int index = 0;
    for (WOOJiuListDemoModel * listModel in dataArr) {
        listModel.isRight = index % 2 == 0;
        index ++;
    }
    self.dataList = [dataArr copy];
}

- (WOOGoodsModel *)createAGoodsModel {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:@"10023" forKey:@"goodsId"];
    [dic setValue:@"https://img13.360buyimg.com/babel/s320x320_jfs/t25333/286/1148627644/132468/e935cde5/5b8df4e1Nfdcae39e.jpg" forKey:@"goodsCoverUrl"];
    [dic setValue:@"索尼（SONY）ILCE-7RM3全画幅微单数码相机 SEL24240镜头套装" forKey:@"goodsName"];
    [dic setValue:@"约4240万有效像素4K视频5轴防抖 a7RM3/a7r3" forKey:@"goodsDesc"];
    [dic setValue:@"2299" forKey:@"goodsPrice"];
    [dic setValue:@"300" forKey:@"cashBack"];

    WOOGoodsModel * model = [[WOOGoodsModel alloc]initWithDictionary:dic];
    return model;
}

- (NSMutableArray *)mainModelArray {
    if (!_mainModelArray) {
        _mainModelArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _mainModelArray;
}

@end

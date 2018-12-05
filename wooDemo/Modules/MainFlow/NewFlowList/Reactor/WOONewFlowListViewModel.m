//
//  WOONewFlowListViewModel.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewFlowListViewModel.h"
#import "WOOUserDeviceModel.h"
#import "WOOLoginService.h"
#import "WOOMainFlowListApi.h"
#import "WOOGoodsModel.h"

@interface WOONewFlowListViewModel ()

@property (strong, nonatomic)NSString * mainApiHost;

@property (strong, nonatomic)NSArray<WOONewListModel *> * dataList;

@property (strong, nonatomic)RACSubject *errorSubject;

@end

@implementation WOONewFlowListViewModel

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
    [self refreshTheDataWithPramdic:pramDic refreshType:refreshType];
}

#pragma mark- 下拉刷新
- (void)refreshTheDataWithPramdic:(NSDictionary *)pramDic refreshType:(WOORefreshType)type{
    @weakify(self)
    [WOOMainFlowListApi getTheMainFlowListWithPath:self.mainApiHost Dictionary:pramDic completion:^(WOOMainFlowModel * _Nonnull model, NSError * _Nonnull error) {
        @strongify(self)
        if (model) {
            [self configTheModel:model refreshType:type];
        }else{
            [self.errorSubject sendNext:@"error"];
        }
    }];
}

/*
数据处理：
1.找到一个视频，以后可能是找到一个带有标签的视频，现在是第一个视频，取出，打上大视频的标签
2.遍历找到4条不是多图和纯文本的内容，放入新数组，正序遍历
3.新数组中插入两条商品
4.新数组中加入第一步中提取出来的视频
5.遍历剩余的5条数据，删除一条不是多图的内容。将数据放入新数组。
 */
- (void)configTheModel:(WOOMainFlowModel *)model refreshType:(WOORefreshType)type{
    NSMutableArray * resultArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * ArticleArr = [NSMutableArray arrayWithArray:model.articleArray];
    NSMutableArray * goodsArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * bottomArr =[NSMutableArray arrayWithCapacity:0];
    WOOArticleModel * hotVideoModel = nil;
    WOONewListModel * listModel = [[WOONewListModel alloc]init];
    BOOL isfirst = YES;
    for (WOOArticleModel * article in model.articleArray) {
        if (article.has_video && isfirst) {
            isfirst = NO;
            article.isHotVideo = YES;
            hotVideoModel = [[WOOArticleModel alloc]initWithDictionary:[article toDictionary]];
            hotVideoModel.isHotVideo = YES;
            [ArticleArr removeObject:article];
        }
        if (article.image_list.count < 1 && !article.isHotVideo && resultArr.count < 4){
            article.isTopSamCell = YES;
            [resultArr addObject:article];
            [ArticleArr removeObject:article];
        }
        if (article.image_list.count > 0 && bottomArr.count < 4) {
            [bottomArr addObject:article];
            [ArticleArr removeObject:article];
        }
    }
    while (resultArr.count < 4 && ArticleArr.count > 0) {
        WOOArticleModel * article = [ArticleArr firstObject];
        article.isTopSamCell = YES;
        [resultArr addObject:article];
        [ArticleArr removeObject:article];
    }
    while (bottomArr.count < 4 && ArticleArr.count > 0) {
        NSArray * arr = [NSArray arrayWithArray:ArticleArr];
        for (WOOArticleModel * article in arr) {
            if (!article.has_video) {
                article.isTextOnly = YES;
                [bottomArr addObject:article];
                [ArticleArr removeObject:article];
            }
        }
    }
    while (goodsArr.count < 2) {
        [goodsArr addObject:[self createAGoodsModel]];
    }
    
    listModel.TopArray = [resultArr copy];
    listModel.BottomArray = [bottomArr copy];
    listModel.GoodsArray = [goodsArr copy];

    if (resultArr.count == 4 && hotVideoModel) {
        listModel.HotVideoModel = hotVideoModel;
    }
    
    NSMutableArray * modelArray = [NSMutableArray arrayWithCapacity:0];
    [modelArray addObject:listModel];
    
    if (type == WOORefreshTypeFooter) {
       self.dataList =  [self.dataList arrayByAddingObjectsFromArray:[modelArray copy]];
    }else{
        self.dataList = [modelArray copy];
    }
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

@end

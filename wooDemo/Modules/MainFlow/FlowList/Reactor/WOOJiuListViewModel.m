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

@interface WOOJiuListViewModel()

@property (strong, nonatomic)NSArray<WOOArticleModel *> * dataList;

@property (strong, nonatomic)NSString * mainApiHost;

@end

@implementation WOOJiuListViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
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
    NSDictionary * dic = [NSDictionary dictionary];
    if (!self.mainApiHost) {return;}
    NSLog(@"%@",self.mainApiHost);
    self.mainApiHost = @"http://47.104.253.57/service/1/article/v1/stream/";
    [WOOMainFlowListApi getTheMainFlowListWithPath:self.mainApiHost
                                        Dictionary:dic
                                        completion:^(WOOMainFlowModel * _Nonnull model, NSError * _Nonnull error) {
        NSMutableArray * modelArr = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 8; i++) {
            WOOMainFlowModel * mainModel = [[WOOMainFlowModel alloc]initWithDictionary:[model toDictionary]];
            for (WOOArticleModel * articleModel in mainModel.articleArray) {
                [modelArr addObject:articleModel];
            }
        }
        self.dataList = [modelArr copy];
    }];
}

@end

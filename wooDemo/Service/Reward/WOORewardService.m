//
//  WOORewardService.m
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOORewardService.h"

@implementation WOORewardService

+ (void)getTheRewardListStartIndex:(NSInteger)startIndex
                        Completion:(void (^)(NSArray<WOORewardRow *> * , NSError * ))completion {
    [[WOOHTTPManager sharedManager] GET:@"/self/reward/logs"
                             parameters:@{@"startidx": @(startIndex),
                                          @"endidx": @(startIndex + 20)}
                                success:^(NSURLSessionDataTask *task, WOOResponseObject *wooResponse) {
                                    if (wooResponse.code == 1) {
                                        NSArray *rows = [NSArray yy_modelArrayWithClass:[WOORewardRow class]
                                                                                      json:[wooResponse.result objectForKey:@"rows"]];
                                        completion(rows, nil);
                                    } else {
                                        completion(nil, [NSError errorWithCode:wooResponse.errorId desc:wooResponse.errorDesc]);
                                    }
                                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                    completion(nil, error);
                                }];
}


+ (void)getTheRewardDetailWithRewardId:(NSString *)rewardId
                            completion:(void (^)(WOORewardRow * , NSError * ))completion {
    NSString * path = FORMAT(@"/self/reward/%@/detail",rewardId);
    [[WOOHTTPManager sharedManager] GET:path parameters:nil success:^(NSURLSessionDataTask *task, WOOResponseObject *wooResponse) {
        if (wooResponse.code == 1) {
            WOORewardRow * row = [WOORewardRow yy_modelWithDictionary:wooResponse.result];
            completion(row, nil);
        }else{
            completion(nil, [NSError errorWithCode:wooResponse.errorId desc:wooResponse.errorDesc]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

+ (void)postARewardWithParamDic:(NSDictionary *)paramDic
                     completion:(void (^)(WOORewardRow * , NSError * ))completion {
    NSString * path = @"self/reward/post";
    [[WOOHTTPManager sharedManager] POST:path HTTPBody:paramDic success:^(NSURLSessionDataTask *task, WOOResponseObject *responseObject) {
        if (responseObject.code == 1) {
            WOORewardRow * row = [WOORewardRow yy_modelWithDictionary:responseObject.result];
            completion(row, nil);
        }else{
            completion(nil, [NSError errorWithCode:responseObject.errorId desc:responseObject.errorDesc]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

+ (void)getTheRewardPayedWithOrderId:(NSString *)OrderId completion:(void (^)(BOOL, NSError * ))completion {
    NSString * path = FORMAT(@"self/reward/%@/paid",OrderId);
    [[WOOHTTPManager sharedManager] GET:path parameters:nil success:^(NSURLSessionDataTask *task, WOOResponseObject *wooResponse) {
        if (wooResponse.code == 1) {
            completion(YES, nil);
        }else{
            completion(NO, [NSError errorWithCode:wooResponse.errorId desc:wooResponse.errorDesc]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(NO, error);
    }];
}
@end


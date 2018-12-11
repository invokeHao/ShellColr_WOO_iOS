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

@end


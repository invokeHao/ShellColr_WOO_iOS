//
//  WOOFavoriteService.m
//  wooDemo
//
//  Created by colr on 2018/12/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOFavoriteService.h"

@implementation WOOFavoriteService

+ (void)getTheFavoriteListWithStartIndex:(NSInteger)startIndex completion:(void (^)(NSArray<WOOGoodsModel *> * , NSError * ))completion {
    [[WOOHTTPManager sharedManager] GET:@"/self/merchandise/favor"
                             parameters:@{@"startidx": @(startIndex),
                                          @"endidx": @(startIndex + 49)}
                                success:^(NSURLSessionDataTask *task, WOOResponseObject *wooResponse) {
                                    if (wooResponse.code == 1) {
                                        NSArray *rows = [NSArray yy_modelArrayWithClass:[WOOGoodsModel class]
                                                                                   json:[wooResponse.result objectForKey:@"rows"]];
                                        completion(rows, nil);
                                    } else {
                                        completion(nil, [NSError errorWithCode:wooResponse.errorId desc:wooResponse.errorDesc]);
                                    }
                                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                    completion(nil, error);
                                }];
}

+ (void)postTheFavoriteWithArticleId:(NSString *)articleId completion:(void (^)(BOOL, NSError * ))completion {
    NSString * path = FORMAT(@"/article/%@/favor",articleId);
    [[WOOHTTPManager sharedManager] POST:path parameters:nil success:^(NSURLSessionDataTask *task, WOOResponseObject *responseObject) {
        if (responseObject.code == 1) {
            completion(YES, nil);
        }else{
            completion(NO, [NSError errorWithCode:responseObject.errorId desc:responseObject.errorDesc]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(NO, nil);
    }];
}

@end

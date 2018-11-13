//
//  WOOMainFlowListApi.m
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMainFlowListApi.h"

@implementation WOOMainFlowListApi

+ (void)getTheMainFlowListWithPath:(NSString *)path
                        Dictionary:(NSDictionary *)paramDic
                        completion:(void (^)(WOOMainFlowModel * , NSError *))completion {
    [[WOOHTTPManager manager] GET:path parameters:paramDic success:^(NSURLSessionDataTask *task, WOOResponseObject *cmsResponse) {
        if ([cmsResponse.message isEqualToString:@"success"]) {
            completion(cmsResponse.mainFlowModel,nil);
        }else{
            NSError *error = [NSError errorWithDomain:@"获取api列表失败"
                                                 code:1
                                             userInfo:nil];
            completion(nil,error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        completion(nil,error);
    }];
}

@end

//
//  WOOFeedbackApi.m
//  wooDemo
//
//  Created by colr on 2018/11/21.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOFeedbackApi.h"
#import "WOOUserDeviceModel.h"

@implementation WOOFeedbackApi

+ (void)postTheReadLogWithDataDic:(NSDictionary *)dataDic
                       completion:(void (^)(BOOL, NSError * ))completion {
    NSMutableDictionary * Mutabledic = [NSMutableDictionary dictionary];
    
    WOOUserDeviceModel * model = [[WOOUserDeviceModel alloc]init];
    NSDictionary * dic = [model toDictionary];
    [Mutabledic setObject:dic forKey:@"header"];
    [Mutabledic setObject:dataDic forKey:@"article"];
    
    NSString * path = FORMAT(@"http:/47.101.155.197/service/1/article/v1/log/");
    [[WOOHTTPManager sharedManager] TTPOST:path parameters:Mutabledic success:^(NSURLSessionDataTask *task, WOOResponseObject *responseObject) {
        if (responseObject.errorId == 0) {
            completion(YES,nil);
        }else{
            NSError *error = [NSError errorWithDomain:@"反馈失败"
                                                 code:1
                                             userInfo:nil];
            completion(NO,error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(NO,error);
        NSLog(@"%@",error);
    }];
}

@end

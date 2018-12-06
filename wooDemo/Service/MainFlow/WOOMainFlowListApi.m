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
//    NSLog(@"%@",path);
//    NSLog(@"%@",paramDic);
    [[WOOHTTPManager manager] GET:path parameters:paramDic success:^(NSURLSessionDataTask *task, WOOResponseObject *cmsResponse) {
        if ([cmsResponse.message isEqualToString:@"success"]) {
            completion(cmsResponse.mainFlowModel,nil);
        }else{
            NSError *error = [NSError errorWithDomain:@"获取flow列表失败"
                                                 code:1
                                             userInfo:nil];
            completion(nil,error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        completion(nil,error);
    }];
}

+ (void)getTheDetailDataWithItemID:(NSString *)ItemId completion:(void (^)(NSString * , NSError * ))completion {
    NSString * path = FORMAT(@"http://is.snssdk.com/article/content/11/1/%@/%@/1/",ItemId, ItemId);
    NSLog(@"path===%@",path);
    [[WOOHTTPManager manager] EasyGET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObjc) {
        if (responseObjc) {
            NSString * htmlStr = responseObjc[@"data"][@"content"];
            completion(htmlStr, nil);
        }else{
            completion(nil,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

+ (void)getTheDetailVideoUrlWithVideoId:(NSString *)videoId completion:(void (^)(WOOMainVideoModel *, NSError *))completion {
    if (!videoId) {
        return;
    }
    NSString * path = FORMAT(@"http://is.snssdk.com/video/urls/1/toutiao/mp4/%@",videoId);
    [[WOOHTTPManager manager] EasyGET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObjc) {
        if (responseObjc) {
            NSInteger code = [responseObjc[@"code"] integerValue];
            if (code == 0) {
                WOOMainVideoModel * model = [[WOOMainVideoModel alloc]initWithDictionary:responseObjc[@"data"]];
                completion(model, nil);
            }else{
                completion(nil, nil);
            }
        }else{
            completion(nil,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil, error);
    }];
}

@end

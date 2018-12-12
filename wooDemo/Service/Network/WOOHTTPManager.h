//
//  WOOHTTPManager.h
//  cosmos
//
//  Created by Lane on 2018/4/2.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#import "WOOPageData.h"
#import "WOOResponseObject.h"

@class WOOResponseObject;

@interface WOOHTTPManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

+ (void)tearDown;

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask * task, WOOResponseObject * cmsResponse))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, WOOResponseObject *responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                      HTTPBody:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, WOOResponseObject *responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (NSURLSessionDataTask *)request:(NSMutableURLRequest *)req
                       success:(void (^)(WOOResponseObject *responseObject))success
                       failure:(void (^)(NSError *error))failure;

#pragma mark- TT专属请求
- (NSURLSessionDataTask *)TTGET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask * task, WOOResponseObject * cmsResponse))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;


- (NSURLSessionDataTask *)TTEasyGET:(NSString *)URLString
                       parameters:(id)parameters
                          success:(void (^)(NSURLSessionDataTask * task, id responseObjc))success
                          failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

- (NSURLSessionDataTask *)TTPOST:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(NSURLSessionDataTask *task, WOOResponseObject *responseObject))success
                         failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (NSURLSessionDataTask *)TTPOST:(NSString *)URLString
                      HTTPBody:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObjc))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end

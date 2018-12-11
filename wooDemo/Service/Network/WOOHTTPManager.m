//
//  CMSHTTPManager.m
//  cosmos
//
//  Created by Lane on 2018/4/2.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "WOOHTTPManager.h"
#import "WOOResponseObject.h"
#import "WOOServiceGlobalConfig.h"
#import "WOOUserDeviceModel.h"

static dispatch_once_t onceToken;

@interface WOOHTTPManager ()

@end

@implementation WOOHTTPManager

+ (instancetype)sharedManager {
    static id manager = nil;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:[WOOServiceGlobalConfig shareInstance].apiDomain];
        manager = [[self alloc] initWithBaseURL:baseURL];
    });
    return manager;
}

+ (void)tearDown {
    onceToken = 0l;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        AFHTTPRequestSerializer *serializer = self.requestSerializer;
        serializer.timeoutInterval = 20;
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        AFHTTPResponseSerializer *reponseSerializer = self.responseSerializer;
        NSMutableSet *acceptTypes = [reponseSerializer.acceptableContentTypes mutableCopy];
        [acceptTypes addObject:@"text/html"];
        [acceptTypes addObject:@"text/plain"];
//        [acceptTypes addObject:@"application/json"];
//        [acceptTypes addObject:@"text/json"];

        reponseSerializer.acceptableContentTypes = acceptTypes;
#ifdef DEBUG
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        self.securityPolicy = securityPolicy;
#endif
    }
    return self;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask * task, WOOResponseObject * cmsResponse))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure {
    [self woo_configHttpHeaderField];
    NSURLSessionDataTask *task = [self GET:URLString
                                parameters:parameters
                                  progress:nil
                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           WOOResponseObject *cmsResponse = [[WOOResponseObject alloc]initWithDictionary:responseObject];
                                           if (cmsResponse.errorId == 0) {
                                               success(task, cmsResponse);
                                           } else {
                                               NSError *error = [NSError errorWithDomain:cmsResponse.errorDesc
                                                                                    code:cmsResponse.code
                                                                                userInfo:nil];
                                               failure(task, error);
                                           }
                                       });
                                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           failure(task, error);
                                       });
                                   }];
    return task;
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, WOOResponseObject *responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    [self woo_configHttpHeaderField];
    NSURLSessionDataTask *task = [self POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            WOOResponseObject *cmsResponse = [[WOOResponseObject alloc]initWithDictionary:responseObject];
            if (cmsResponse.errorId == 0) {
                success(task, cmsResponse);
            } else {
                NSError *error = [NSError errorWithDomain:cmsResponse.errorDesc
                                                     code:cmsResponse.code
                                                 userInfo:nil];
                failure(task, error);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
        });
    }];
    return task;
}

#pragma mark- TT专属请求

#pragma mark- 不封装返回数据

- (NSURLSessionDataTask *)TTEasyGET:(NSString *)URLString
                         parameters:(id)parameters
                            success:(void (^)(NSURLSessionDataTask * task, id responseObjc))success
                            failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure {
    NSURLSessionDataTask *task = [self GET:URLString
                                parameters:parameters
                                  progress:nil
                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           if (responseObject) {
                                               success(task, responseObject);
                                           } else {
                                               NSError * error = [NSError errorWithCode:1 desc:@"请求错误"];
                                               failure(task, error);
                                           }
                                       });
                                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           failure(task, error);
                                       });
                                   }];
    return task;
}

- (NSURLSessionDataTask *)TTGET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask * task, WOOResponseObject * cmsResponse))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure {
    [self woo_configHttpHeaderField];
    NSURLSessionDataTask *task = [self GET:URLString
                                parameters:parameters
                                  progress:nil
                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           WOOResponseObject *cmsResponse = [[WOOResponseObject alloc]initWithDictionary:responseObject];
                                           if (cmsResponse.errorId == 0) {
                                               success(task, cmsResponse);
                                           } else {
                                               NSError *error = [NSError errorWithDomain:cmsResponse.errorDesc
                                                                                    code:cmsResponse.code
                                                                                userInfo:nil];
                                               failure(task, error);
                                           }
                                       });
                                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           failure(task, error);
                                       });
                                   }];
    return task;
}


- (NSURLSessionDataTask *)TTPOST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, WOOResponseObject *responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    NSURLSessionDataTask *task = [self POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            WOOResponseObject *cmsResponse = [[WOOResponseObject alloc]initWithDictionary:responseObject];
            if (cmsResponse.errorId == 0) {
                success(task, cmsResponse);
            } else {
                NSError *error = [NSError errorWithDomain:cmsResponse.errorDesc
                                                     code:cmsResponse.code
                                                 userInfo:nil];
                failure(task, error);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failure(task, error);
        });
    }];
    return task;
}


- (NSURLSessionDataTask *)POST:(NSString *)URLString
                      HTTPBody:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, WOOResponseObject *responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", [WOOServiceGlobalConfig shareInstance].apiDomain, URLString];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST"
                                                                             URLString:urlStr
                                                                            parameters:nil
                                                                                 error:nil];
    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req setValue:[WOOLoginManager token] forHTTPHeaderField:@"x-token"];
    __block NSURLSessionDataTask *task = [self dataTaskWithRequest:req uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                WOOResponseObject *cmsResponse = [WOOResponseObject yy_modelWithJSON:responseObject];
                if (cmsResponse.errorId == 0) {
                    success(task, cmsResponse);
                } else {
                    NSError *error = [NSError errorWithCode:cmsResponse.errorId
                                                       desc:cmsResponse.errorDesc];
                    failure(task, error);
                }
            } else {
                failure(task, error);
            }
        });
    }];
    [task resume];
    return task;
}



- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    NSURLSessionDataTask *task = [self POST:URLString
                                 parameters:parameters
                  constructingBodyWithBlock:block
                                   progress:nil
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            WOOResponseObject *cmsResponse = [WOOResponseObject yy_modelWithJSON:responseObject];
                                            if (cmsResponse.errorId == 0) {
                                                success(task, cmsResponse);
                                            } else {
                                                NSError *error = [NSError errorWithDomain:cmsResponse.errorDesc
                                                                                     code:cmsResponse.code
                                                                                 userInfo:nil];
                                                failure(task, error);
                                            }
                                        });
                                    }
                                    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            failure(task, error);
                                        });
                                    }];
    return task;
}

- (NSURLSessionDataTask *)request:(NSMutableURLRequest *)req
                          success:(void (^)(WOOResponseObject *responseObject))success
                          failure:(void (^)(NSError *error))failure {
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req setValue:[WOOLoginManager token] forHTTPHeaderField:@"x-token"];
    NSURLSessionDataTask *task = [self dataTaskWithRequest:req uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                WOOResponseObject *cmsResponse = [WOOResponseObject yy_modelWithJSON:responseObject];
                if (cmsResponse.errorId == 0) {
                    success(cmsResponse);
                } else {
                    NSError *error = [NSError errorWithCode:cmsResponse.errorId
                                                       desc:cmsResponse.errorDesc];
                    failure(error);
                }
            } else {
                failure(error);
            }
        });
    }];
    [task resume];
    return task;
}

#pragma mark- POST Body
- (NSURLSessionDataTask *)Post:(NSString *)URLString
                      HTTPBody:(NSDictionary *)bodyDic
                       success:(void (^) (id responseObject))success
                       failure:(void (^)(id responseObject))failure {
    [self woo_configHttpHeaderField];
    NSMutableDictionary * mDic = [NSMutableDictionary dictionaryWithCapacity:0];
    [mDic setObject:@"application/json" forKey:@"Content-Type"];
    [mDic setObject:@"application/json" forKey:@"Accept"];
    [mDic setObject:@"xxxxx" forKey:@"x-token"];
    NSError *error;
    NSData *Data = [NSJSONSerialization dataWithJSONObject:bodyDic options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:Data encoding:NSUTF8StringEncoding];
    NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask * task = [self POST:URLString parameters:bodyDic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
       [formData appendPartWithHeaders:mDic body:jsonData];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    return task;
}

- (void)woo_configHttpHeaderField {
    [[self requestSerializer] setValue:[WOOLoginManager token] forHTTPHeaderField:@"x-token"];
    [[self requestSerializer] setValue:@"ecypc8htcxr8lq7a" forHTTPHeaderField:@"x-app-id"];
    [[self requestSerializer] setValue:@"colr.ios.phone" forHTTPHeaderField:@"x-site-code"];
    [[self requestSerializer] setValue:@"appstore" forHTTPHeaderField:@"x-channel"];
    WOOUserDeviceModel * model = [[WOOUserDeviceModel alloc]init];
    [[self requestSerializer] setValue:model.Openudid forHTTPHeaderField:@"x-dev-id"];
}

@end


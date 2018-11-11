//
//  WOOLoginService.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOLoginService.h"
#import "WOOUserDeviceModel.h"

@implementation WOOLoginService

+ (void)loginWithThirdAuthResponse:(WOOThirdAuthResponse *)authResponse completion:(void (^)(WOOLoginModel *, NSError *))completion {
    if (!authResponse) {
        return;
    }
    NSString *path = @"/auth/signon/3rd";
    NSDictionary *dict = @{
                           @"avti": @(authResponse.avti),
                           @"code": authResponse.code ? authResponse.code : @"",
                           @"openid": authResponse.openid ? authResponse.openid : @""
                           };
    [WOOHud showActivityView];
    [[WOOHTTPManager sharedManager] POST:path
                              parameters:dict
                                 success:^(NSURLSessionDataTask *task, id responseObject) {
                                     WOOResponseObject *resp = responseObject;
                                     if (resp.code == 1) {
                                         WOOLoginModel *model = [[WOOLoginModel alloc] initWithDictionary:resp.result];
                                         completion(model, nil);
                                     } else {
                                         completion(nil, [NSError errorWithCode:resp.errorId desc:resp.errorDesc]);
                                     }
                                     [WOOHud hideActivityView];
                                 } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                     completion(nil, error);
                                     [WOOHud hideActivityView];
                                 }];
}

+ (void)postForCodeToPhoneNumber:(NSString *)phoneNumber completion:(void (^)(WOOValidCode *, NSError *))completion {
    NSString *path = @"/verify/code/send";
    NSDictionary *dict = @{@"avti": @(CMSAvtiTypeMobile),
                           @"authvalue": phoneNumber ? phoneNumber : @"",
                           @"cti" : @(CMSCtlTypeBinding)
                           };
    
    [[WOOHTTPManager sharedManager] POST:path
                              parameters:dict
                                 success:^(NSURLSessionDataTask *task, id responseObject) {
                                     WOOResponseObject *resp = responseObject;
                                     if (resp.code == 1) {
                                         WOOValidCode *model = [[WOOValidCode alloc] initWithDictionary:resp.result];
                                         completion(model, nil);
                                     } else {
                                         completion(nil, [NSError errorWithCode:resp.errorId desc:resp.errorDesc]);
                                     }
                                 } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                     completion(nil, error);
                                 }];
}

+ (void)postForBindPhoneNumber:(NSString *)phoneNumber code:(NSString *)code completion:(void (^)(WOOMobileAuth *, NSError *))completion {
    NSString *path = @"/self/auth/self/bind";
    NSDictionary *dict = @{@"avti": @(CMSAvtiTypeMobile),
                           @"authvalue": phoneNumber ? phoneNumber : @"",
                           @"verifycode" : code ? code : @""
                           };
    [[WOOHTTPManager sharedManager] POST:path
                              parameters:dict
                                 success:^(NSURLSessionDataTask *task, id responseObject) {
                                     WOOResponseObject *resp = responseObject;
                                     if (resp.code == 1) {
                                         WOOMobileAuth *mobileAuth = [[WOOMobileAuth alloc] initWithDictionary:resp.result];
                                         completion(mobileAuth, nil);
                                     } else {
                                         completion(nil, [NSError errorWithCode:resp.errorId desc:resp.errorDesc]);
                                     }
                                 } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                     completion(nil, error);
                                 }];
}


+ (void)loginWithUserName:(NSString *)userName
                      pwd:(NSString *)pwd
               completion:(void (^)(WOOLoginModel *, NSError *))completion {
    if (!userName || [userName isEqualToString:@""]) {
        completion(nil ,[NSError errorWithCode:0 userInfo:@{@"response": @"userName nil"}]);
    }
    if (!pwd || [pwd isEqualToString:@""]) {
        completion(nil ,[NSError errorWithCode:0 userInfo:@{@"response": @"pwd nil"}]);
    }
    
    NSString *path = @"/auth/signon/pwd";
    NSDictionary *dict = @{
                           @"authvalue": userName,
                           @"authpwd": pwd
                           };
    [WOOHud showActivityView];
    [[WOOHTTPManager sharedManager] POST:path
                              parameters:dict
                                 success:^(NSURLSessionDataTask *task, id responseObject) {
                                     WOOResponseObject *resp = responseObject;
                                     if (resp.code == 1) {
                                         WOOLoginModel *model = [[WOOLoginModel alloc] initWithDictionary:resp.result];
                                         completion(model, nil);
                                     } else {
                                         completion(nil, [NSError errorWithCode:resp.errorId desc:resp.errorDesc]);
                                     }
                                     [WOOHud hideActivityView];
                                 } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                     completion(nil, error);
                                     [WOOHud hideActivityView];
                                 }];
}

+ (void)initNewUserWithDictionary:(NSDictionary *)deviceDic completion:(void (^)(NSError * _Nonnull error))completion {
    WOOUserDeviceModel * model = [[WOOUserDeviceModel alloc]init];
    NSDictionary * dic = [model toDictionary];
    NSString * path = FORMAT(@"http://47.104.253.57/service/init/");
    NSLog(@"%@",dic);
    [[WOOHTTPManager sharedManager] POST:path parameters:dic success:^(NSURLSessionDataTask *task, WOOResponseObject *responseObject) {
        completion(nil);
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(error);
        NSLog(@"%@",error);
    }];
}

+ (void)getTheSteamServiceListWithDictionary:(NSDictionary*)dic completion:(nonnull void (^)(NSError * _Nonnull))completion {
    WOOUserDeviceModel * model = [[WOOUserDeviceModel alloc]init];
    NSDictionary * pramDic = [model streamListDictionary];
    NSString * path = FORMAT(@"http://47.104.253.57/service/settings/stream/");
    NSLog(@"%@",pramDic);
    [[WOOHTTPManager sharedManager] POST:path parameters:pramDic success:^(NSURLSessionDataTask *task, WOOResponseObject *responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}


@end

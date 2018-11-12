//
//  WOOLoginService.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOLoginModel.h"
#import "WOOThirdAuthResponse.h"
#import "WOOValidCode.h"
#import "WOOThirdPartyConstant.h"
#import "WOOApiHostModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface WOOLoginService : NSObject

+ (void)loginWithThirdAuthResponse:(WOOThirdAuthResponse *)authResponse completion:(void (^)(WOOLoginModel *loginModel, NSError *error))completion;

+ (void)postForCodeToPhoneNumber:(NSString *)phoneNumber completion:(void (^)(WOOValidCode *validCode, NSError *error))completion;

+ (void)postForBindPhoneNumber:(NSString *)phoneNumber code:(NSString *)code completion:(void (^)(WOOMobileAuth *mobileAuth, NSError *error))completion;

+ (void)loginWithUserName:(NSString *)userName
                      pwd:(NSString *)pwd
               completion:(void (^)(WOOLoginModel *, NSError *))completion;

#pragma mark- 初始化用户
+ (void)initNewUserWithDictionary:(NSDictionary*)deviceDic
                       completion:(void (^)(BOOL isSuccess, NSError * error))completion;

+ (void)getTheSteamServiceListWithDictionary:(NSDictionary*)dic
                                  completion:(void (^)(NSArray<WOOApiHostModel *>* apiModelArr, NSError * error))completion;

@end

NS_ASSUME_NONNULL_END

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


NS_ASSUME_NONNULL_BEGIN

@interface WOOLoginService : NSObject

+ (void)loginWithThirdAuthResponse:(WOOThirdAuthResponse *)authResponse completion:(void (^)(WOOLoginModel *loginModel, NSError *error))completion;

+ (void)postForCodeToPhoneNumber:(NSString *)phoneNumber completion:(void (^)(WOOValidCode *validCode, NSError *error))completion;

+ (void)postForBindPhoneNumber:(NSString *)phoneNumber code:(NSString *)code completion:(void (^)(WOOMobileAuth *mobileAuth, NSError *error))completion;

+ (void)loginWithUserName:(NSString *)userName
                      pwd:(NSString *)pwd
               completion:(void (^)(WOOLoginModel *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END

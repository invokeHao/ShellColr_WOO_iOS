//
//  WOOLoginManager.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WOOThirdPartyConstant.h"
#import "WOOThirdAuthResponse.h"
#import "WOOLoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOLoginManager : NSObject

@property (nonatomic, strong) TencentOAuth *tencentOAuth;
@property (nonatomic, strong) WOOLoginModel *userLoginModel;

+ (instancetype)sharedManager;


// 是否是已经登陆授权过的界面层级
+ (BOOL)isAuthModule;

+ (NSString *)token;

+ (NSString *)userID;

+ (NSString *)imToken;

+ (NSString *)imUserID;

+ (BOOL)needAuth;

+ (BOOL)needBindPhone;

- (void)requestForQQInfo;

- (void)updateMobileAuth:(WOOMobileAuth *)mobileAuth;

- (void)updateLoginModelCache:(WOOLoginModel *)userModel;

- (void)clearCache;

+ (void)removeAlias;

// 退出登陆前 清除所以缓存信息
+ (void)exitWithClearAllCache;


@end

NS_ASSUME_NONNULL_END

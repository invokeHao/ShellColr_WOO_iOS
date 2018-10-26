//
//  WOOLoginManager.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOLoginManager.h"
#import "WOOLoginService.h"
#import "AppDelegate.h"

//#import "CMSBaseNavigationController.h"
//#import "CMSConversationManager.h"
#import "UIPasteboard+CMSVerify.h"
#import "WOOLoginViewController.h"

#import <PINCache/PINCache.h>
#import <UMPush/UMessage.h>

NSString * const kPinCacheUserInfoKey = @"kPinCacheUserInfoKey";
NSString * const kPinCacheCurrentCircleKey = @"kPinCacheCurrentCircleKey";

@interface WOOLoginManager () <TencentSessionDelegate> {
    WOOLoginModel *_userModel;
}

@property (nonatomic, strong) NSArray *tencentPermissions;

@end

@implementation WOOLoginManager

+ (instancetype)sharedManager {
    static WOOLoginManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WOOLoginManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:CMSQQAppkey
                                                andDelegate:self];
        
        _tencentPermissions = @[@"get_user_info", @"get_simple_userinfo", @"add_t"];
    }
    return self;
}

+ (BOOL)isAuthModule {
    UINavigationController *navigationController = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *firstViewController = [navigationController.viewControllers firstObject];
    if ([firstViewController isKindOfClass:[WOOLoginViewController class]]) {
        return NO;
    }else {
        return YES;
    }
}

#pragma mark - Public

- (void)requestForQQInfo {
    [self.tencentOAuth authorize:_tencentPermissions inSafari:NO];
}

- (void)updateLoginModelCache:(WOOLoginModel *)userModel {
    _userModel = userModel;
    [[PINCache sharedCache] setObject:userModel forKey:kPinCacheUserInfoKey];
}

- (void)clearCache {
    _userModel = nil;
    [[PINCache sharedCache] removeAllObjects];
}

#pragma mark - TencentSessionDelegate

- (void)tencentDidLogin {
    WOOThirdAuthResponse *response = [[WOOThirdAuthResponse alloc] initWithOpenId:self.tencentOAuth.openId
                                                                             code:self.tencentOAuth.accessToken
                                                                             avti:CMSThirdPartyTypeQQ];
    
    [WOOLoginService loginWithThirdAuthResponse:response completion:^(WOOLoginModel *loginModel, NSError *error) {
        if (error) {
            [WOOHud showString:@"QQ认证失败"];
        } else {
            [WOOLoginManager sharedManager].userLoginModel = loginModel;
        }
    }];
}

- (void)tencentDidNotLogin:(BOOL)cancelled {
    
}

- (void)tencentDidNotNetWork {
    
}

- (void)setUserLoginModel:(WOOLoginModel *)userLoginModel {
    if (userLoginModel) {
        _userModel = userLoginModel;
//        [Instabug setUserAttribute:userLoginModel.profile.nickname withKey:@"nickname"];
        [self blindAlias];
        [[PINCache sharedCache] setObject:userLoginModel forKey:kPinCacheUserInfoKey];
    } else {
        [WOOHud showString:@"登录失败"];
    }
}

- (WOOLoginModel *)userLoginModel {
    if (_userModel) {
        return _userModel;
    }
    _userModel = (WOOLoginModel *)[[PINCache sharedCache] objectForKey:kPinCacheUserInfoKey];
    return _userModel;
}


- (void)updateMobileAuth:(WOOMobileAuth *)mobileAuth {
    _userModel.mobileAuth = mobileAuth;
    [[PINCache sharedCache] setObject:_userModel forKey:kPinCacheUserInfoKey];
}

#pragma mark - Class Method

+ (BOOL)needAuth {
    BOOL isAuth = YES;
    if ([WOOLoginManager sharedManager].userLoginModel) {
        isAuth = [WOOLoginManager sharedManager].userLoginModel.authToken.accessExpire < [[NSDate date] timeIntervalSince1970] * 1000;
    }
    return isAuth;
}

+ (BOOL)needBindPhone {
    BOOL needBind = YES;
    if ([WOOLoginManager sharedManager].userLoginModel) {
        needBind = [WOOLoginManager sharedManager].userLoginModel.mobileAuth.authNo ? NO : YES;
    }
    return needBind;
}

+ (NSString *)token {
    NSString *apiToken = @""; // TO DO, Online Set to @"";
    if ([WOOLoginManager sharedManager].userLoginModel) {
        apiToken = [WOOLoginManager sharedManager].userLoginModel.authToken.accessToken;
    }
    return apiToken;
}

+ (NSString *)imToken {
    NSString *imToken = @"";
    if ([WOOLoginManager sharedManager].userLoginModel) {
        imToken = [WOOLoginManager sharedManager].userLoginModel.profile.imToken;
    }
    return imToken;
}

+ (NSString *)imUserID {
    NSString *imID = @"";
    if ([WOOLoginManager sharedManager].userLoginModel) {
        imID = [WOOLoginManager sharedManager].userLoginModel.profile.imUserNo;
    }
    return imID;
}

+ (NSString *)userID {
    NSString *useNo = @"";
    if ([WOOLoginManager sharedManager].userLoginModel) {
        useNo = [WOOLoginManager sharedManager].userLoginModel.profile.userNo;
    }
    return useNo;
}



- (void)blindAlias {
    NSLog(@"userId==%@",[WOOLoginManager userID]);
    [UMessage setAlias:[WOOLoginManager userID] type:@"moboo" response:^(id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject);
    }];
}

+ (void)removeAlias {
    [UMessage removeAlias:[WOOLoginManager userID] type:@"moboo" response:^(id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject);
    }];
}

// 退出登录
+ (void)exitWithClearAllCache {
    [[WOOLoginManager sharedManager] clearCache];
    [WOOLoginManager removeAlias];
    // 清除系统粘贴板的邀请码数据
    if ([[UIPasteboard generalPasteboard] isPlanetInviteCode]) {
        [[UIPasteboard generalPasteboard] cleanGeneralPasteboardString];
    }
}

@end

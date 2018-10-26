//
//  CMSServiceGlobalConfig.m
//  cosmos
//
//  Created by Lane on 2018/3/30.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "WOOServiceGlobalConfig.h"

@interface WOOServiceGlobalConfig ()

@end

@implementation WOOServiceGlobalConfig

+ (instancetype)shareInstance {
    static WOOServiceGlobalConfig *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WOOServiceGlobalConfig alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        BOOL isDebugMode = [[NSUserDefaults standardUserDefaults] boolForKey:WOODebugMode];
        if (isDebugMode) {
            _apiDomain = WOOServiceDomainDevelop;
            NSLog(@"🚀==> 测试环境");
        } else {
            _apiDomain = WOOServiceDomainLive;
            NSLog(@"🚀==> 正式环境");
        }
    }
    return self;
}

- (void)apiEnvironment:(WOOServiceGlobalConfigType)type {
    switch (type) {
        case WOOServiceGlobalConfigTypeAlpha:
            _apiDomain = WOOServiceDomainAlpha;
            break;
        case WOOServiceGlobalConfigTypeBeta:
            _apiDomain = WOOServiceDomainBeta;
            break;
        case WOOServiceGlobalConfigTypeLive:
            _apiDomain = WOOServiceDomainLive;
            break;
            
        default:
            _apiDomain = WOOServiceDomainDevelop;
            break;
    }
}

@end

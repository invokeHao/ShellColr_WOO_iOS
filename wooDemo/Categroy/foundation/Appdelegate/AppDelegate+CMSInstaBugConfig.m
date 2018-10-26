//
//  AppDelegate+CMSInstaBugConfig.m
//  cosmos
//
//  Created by colr on 2018/5/13.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "AppDelegate+CMSInstaBugConfig.h"
#import "ZYNetworkAccessibity.h"
#import "RealReachability.h"

//文档地址https://docs.instabug.com/docs/ios-popups

@implementation AppDelegate (CMSInstaBugConfig)

- (void)configTheInstaBug {
//    [Instabug startWithToken:@"28a679e07feb694df208252d7c391627" invocationEvent:IBGInvocationEventNone];
//    [Instabug setLocale:IBGLocaleChineseSimplified];//语言
//    [Instabug setIntroMessageEnabled:NO];
//    [Instabug setPromptOptionsEnabledWithBug:YES feedback:YES chat:NO];//提出bug  聊天  回复  展示哪个
//    [Instabug setShowEmailField:NO];//设置不显示邮箱
//    
//#ifdef DEBUG
//    [Instabug setInvocationEvent:IBGInvocationEventShake];
//#else
//    [Instabug setInvocationEvent:IBGInvocationEventShake];
//#endif
    
    [ZYNetworkAccessibity setAlertEnable:YES];
    [ZYNetworkAccessibity start];
    [GLobalRealReachability startNotifier];
}

@end

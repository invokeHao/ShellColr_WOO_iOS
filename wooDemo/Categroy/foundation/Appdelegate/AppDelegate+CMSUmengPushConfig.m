//
//  AppDelegate+CMSUmengPushConfig.m
//  cosmos
//
//  Created by colr on 2018/5/13.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "AppDelegate+CMSUmengPushConfig.h"
#import <UMCommon/UMCommon.h>   //  // 公共组件是所有友盟产品的基础组件，必选
#import <UMPush/UMessage.h>    // // Push组件
#import <UserNotifications/UserNotifications.h>   //// Push组件必须的系统库
#import <JLRoutes.h>
//#import "CMSCoreFlowAdditionView.h"

#define UMENG_APPKEY @"5af80db7f43e48513b00032c"

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate (CMSUmengPushConfig)

- (void)configTheUmenPushWithOptions: (NSDictionary*)launchOptions {
    [UMConfigure initWithAppkey:UMENG_APPKEY channel:@"App Store"];
    //iOS10接收消息的代理
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
    entity.types = UMessageAuthorizationOptionBadge | UMessageAuthorizationOptionAlert;
    
    if ([[[UIDevice currentDevice] systemVersion]intValue]>=10) {
        UNNotificationAction *action1_ios10 = [UNNotificationAction actionWithIdentifier:@"action1_identifier" title:@"打开应用" options:UNNotificationActionOptionForeground];
        UNNotificationAction *action2_ios10 = [UNNotificationAction actionWithIdentifier:@"action2_identifier" title:@"忽略" options:UNNotificationActionOptionForeground];
        //UNNotificationCategoryOptionNone
        //UNNotificationCategoryOptionCustomDismissAction  清除通知被触发会走通知的代理方法
        //UNNotificationCategoryOptionAllowInCarPlay       适用于行车模式
        UNNotificationCategory *category1_ios10 = [UNNotificationCategory categoryWithIdentifier:@"category1" actions:@[action1_ios10,action2_ios10]   intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
        NSSet *categories = [NSSet setWithObjects:category1_ios10, nil];
        entity.categories=categories;
    }
    
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            // 用户选择了接收push消息
            NSLog(@"用户选择了接收push消息");
        }else{
            // 用户拒绝接收Push消息
            NSLog(@"用户拒绝接收Push消息");
        }
    }];
}

//iOS10以下使用这两个方法接收通知
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    if ([userInfo objectForKey:@"type"] && [userInfo objectForKey:@"data"]) {
        NSInteger type = [userInfo[@"type"] integerValue];
        NSString *data = userInfo[@"data"];
        if (type == 3001) {
            // 票圈活跃度变更通知

        }
        if (type == 17101 || type == 17102 || type == 17103 || type == 17104) {
            // 完成任务
        }
    }
    
    [UMessage setAutoAlert:NO];
    if([[[UIDevice currentDevice] systemVersion]intValue] < 10){
        [UMessage didReceiveRemoteNotification:userInfo];
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    [UMessage registerDeviceToken:deviceToken];
    NSLog(@" device token %@",[[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]stringByReplacingOccurrencesOfString: @">" withString: @""]stringByReplacingOccurrencesOfString: @" " withString: @""]);
}

//iOS10新增：处理前台收到通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [UMessage setAutoAlert:NO];
        //应用处于前台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
    }else{
        //应用处于前台时的本地推送接受
    }
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}

//iOS10新增：处理后台点击通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台时的远程推送接受
        [UMessage didReceiveRemoteNotification:userInfo];//因为安卓先写，破坏了整体的封装结构，强行组成自己拼
        
        NSString * urlStr = userInfo[@"linkUrl"];
        if (urlStr.length<1) {
            NSString * keyStr = userInfo[@"message"];
            if (keyStr.length>0) {
                urlStr = FORMAT(@"mobu://message/%@",keyStr);
            }else{
                NSString * plantId = userInfo[@"planet_id"];
                if (plantId.length>0) {
                    urlStr = FORMAT(@"mobu://chatRoom/%@",plantId);
                }
            }
        }
        [JLRoutes routeURL:[NSURL URLWithString:urlStr]];
    }else{
        //应用处于后台时的本地推送接受
    }
}

@end

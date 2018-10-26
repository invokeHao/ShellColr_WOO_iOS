//
//  AppDelegate+CMSVersonControl.m
//  cosmos
//
//  Created by colr on 2018/5/14.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "AppDelegate+CMSVersonControl.h"
//#import "CMSVersonModel.h"
#import <AFNetworking.h>
#import "WOOResponseObject.h"
#import "UIPasteboard+CMSVerify.h"
//#import "CMSBaseNavigationController.h"
//#import "CMSMainViewController.h"

@implementation AppDelegate (CMSVersonControl)

- (void)checkTheVerson {
    NSString * uuid = [[NSUUID UUID] UUIDString];
//    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString * appBuildString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}


-(void)cancelTheUpdate{
        //关闭
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    
    [UIView animateWithDuration:0.3f animations:^{
        window.transform = CGAffineTransformMakeScale(1.0, 1/[UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5f animations:^{
            window.transform = CGAffineTransformMakeScale(1/[UIScreen mainScreen].bounds.size.width, 1/[UIScreen mainScreen].bounds.size.height);
        } completion:^(BOOL finished) {
            exit(1);
        }];
    }];
}

@end

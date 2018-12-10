//
//  AppDelegate.m
//  wooDemo
//
//  Created by colr on 2018/10/25.
//  Copyright © 2018 colr. All rights reserved.
//

#import "AppDelegate.h"
#import "WOOLoginManager.h"
#import "WOOLoginViewController.h"
#import "WOOTabBarViewController.h"
#import "WOOBaseNavigationController.h"
#import "WOOUserDeviceModel.h"
#import <IQKeyboardManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self loadCustomViewControllers];
    [self setupIQKeyboardManager];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark - Custom

- (void)loadCustomViewControllers {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = WOOBackgroundColor;
    UIViewController *viewController = nil;
//    if ([WOOLoginManager needAuth] || [WOOLoginManager needBindPhone]) {
//        viewController = [[WOOLoginViewController alloc] init];
//    } else {
        viewController = [[WOOTabBarViewController alloc] initWithTabViewControllerType:(WOOTabViewControllerTypeFind)];
//    }
    WOOBaseNavigationController *navigationController = [[WOOBaseNavigationController alloc] initWithRootViewController:viewController];
    navigationController.navigationBarHidden = YES;
    self.window.rootViewController = navigationController;

//    if ([WOOLoginManager needBindPhone] && ![WOOLoginManager needAuth]) {
//        CMSBindPhoneViewController *bindPhoneViewController = [[CMSBindPhoneViewController alloc] init];
//        [navigationController setViewControllers:@[viewController, bindPhoneViewController]];
//    }

    [self.window makeKeyAndVisible];
}

- (void)setupIQKeyboardManager {
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}


@end

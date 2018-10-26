//
//  WOOTabBarViewController.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//


typedef enum : NSUInteger {
    WOOTabViewControllerTypeFind,
    WOOTabViewControllerTypeMy
} WOOTabViewControllerType;

#import "YPTabBarController.h"

@interface WOOTabBarViewController : YPTabBarController

/**
 init
 
 @param type 默认tab
 */
- (instancetype)initWithTabViewControllerType:(WOOTabViewControllerType)type;


/**
 切换tab
 
 @param type 目标类型
 */
+ (void)switchoverTab:(WOOTabViewControllerType)type;

@end


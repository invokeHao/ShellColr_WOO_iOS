//
//  UIView+WOOHud.h
//  cosmos
//
//  Created by Lane on 2018/5/27.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <objc/runtime.h>

@interface UIView (WOOHud)

- (void)showActivityView;

- (void)hideActivityView;

- (void)showString:(NSString *)string;

@end

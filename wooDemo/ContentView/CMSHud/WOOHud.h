//
//  CMSWOO.h
//  cosmos
//
//  Created by Lane on 2018/5/27.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

static NSTimeInterval const HUDHideDelay = 1.5f;

@interface WOOHud : NSObject

@property (nonatomic, strong, readonly) MBProgressHUD *hud;
@property (nonatomic, strong, readonly) UIView *targetView;

- (instancetype)initWithTargetView:(UIView *)view;

- (void)showActivityView;

- (void)hideActivityView;

// On Window

+ (void)showActivityView;

+ (void)hideActivityView;

+ (void)hideActivityViewWithComplete:(void(^)())complete;

+ (void)showString:(NSString *)string;

+ (void)showString:(NSString *)string hideDelay:(NSTimeInterval)time;

+ (void)showString:(NSString *)string hideDelay:(NSTimeInterval)time offsetY:(CGFloat)offsetY;

@end

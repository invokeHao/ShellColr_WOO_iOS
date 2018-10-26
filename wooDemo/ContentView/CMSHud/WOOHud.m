//
//  CMSWOO.m
//  cosmos
//
//  Created by Lane on 2018/5/27.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "WOOHud.h"
#import "UIView+WOOHud.h"

@interface WOOHud ()

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) UIView *targetView;

@end

@implementation WOOHud

- (instancetype)initWithTargetView:(UIView *)view {
    self = [super init];
    if (self) {
        _targetView = view;
        _hud = [[MBProgressHUD alloc] initWithView:_targetView];
        _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        _hud.bezelView.color = [UIColor woo_colorWithHexString:@"#050506" alpha:0.4];
        _hud.removeFromSuperViewOnHide = YES;
        [self addHudToTargetViewIfNeededAndBringToFront];
    }
    return self;
}

- (void)showActivityView {
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.contentColor = [UIColor whiteColor];
    [_hud showAnimated:YES];
}

- (void)hideActivityView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [_hud hideAnimated:YES];
    });
}

#pragma mark - Helper Method

- (void)addHudToTargetViewIfNeededAndBringToFront {
    if (![_targetView.subviews containsObject:_hud]) {
        [_targetView addSubview:_hud];
    }
    else {
        [_targetView bringSubviewToFront:_hud];
    }
}

// On Window

+ (void)showActivityView {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window showActivityView];
}

+ (void)hideActivityView {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window hideActivityView];
}

+ (void)hideActivityViewWithComplete:(void(^)())complete {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window hideActivityView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        complete();
    });
}

+ (void)showString:(NSString *)string {
    [self showString:string hideDelay:HUDHideDelay];
}

+ (void)showString:(NSString *)string hideDelay:(NSTimeInterval)time {
    [self showString:string hideDelay:time offsetY:0.f];
}

+ (void)showString:(NSString *)string hideDelay:(NSTimeInterval)time offsetY:(CGFloat)offsetY {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    if (window) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [UIColor woo_colorWithHexString:@"#050506" alpha:0.4];
        hud.contentColor = [UIColor whiteColor];
        hud.label.text = string;
        hud.margin = 20.f;
        hud.removeFromSuperViewOnHide = YES;
        hud.offset = CGPointMake(0.f, offsetY);
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES afterDelay:time];
        });
    }
}

@end

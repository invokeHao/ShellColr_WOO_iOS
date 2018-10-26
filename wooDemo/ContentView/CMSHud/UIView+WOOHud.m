//
//  UIView+WOOHud.m
//  cosmos
//
//  Created by Lane on 2018/5/27.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UIView+WOOHud.h"

// Keys for values associated with self
static const NSString * WOOToastActivityViewKey      = @"WOOToastActivityViewKey";
static const NSString * WOOToastTextViewKey          = @"WOOToastTextViewKey";

@implementation UIView (WOOHud)

- (void)showActivityView {
    if (objc_getAssociatedObject(self, &WOOToastActivityViewKey)) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor woo_colorWithHexString:@"#050506" alpha:0.4];
    hud.contentColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    objc_setAssociatedObject(self, &WOOToastActivityViewKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hideActivityView {
    MBProgressHUD *hud = (MBProgressHUD *)objc_getAssociatedObject(self, &WOOToastActivityViewKey);
    if (hud) {
        dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [hud hideAnimated:YES];
            });
            objc_setAssociatedObject(self, &WOOToastActivityViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        });
    }
}

- (void)showString:(NSString *)string {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor woo_colorWithHexString:@"#050506" alpha:0.4];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = string;
    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES afterDelay:1.5f];
    });
}

@end

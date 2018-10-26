//
//  UIView+RoundCorner.m
//  Displayer
//
//  Created by Lane on 2017/10/10.
//  Copyright © 2017年 ShellColr. All rights reserved.
//

#import "UIView+WLRoundCorner.h"

@implementation UIView (WLRoundCorner)

- (void)roundCorner:(UIRectCorner)corners radius:(CGFloat)radius {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:corners
                                                     cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    self.layer.mask = mask;
}

@end

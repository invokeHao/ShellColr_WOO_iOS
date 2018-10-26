//
//  UIView+Extension.m
//
//  Created by dapiao on 15/8/13.
//  Copyright (c) 2015年 dapiao. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}


// edges related

- (CGFloat)cms_top {
    return self.y;
}

- (void)setCms_top:(CGFloat)cms_top {
    self.y = cms_top;
}

- (CGFloat)cms_bottom {
    return self.y + self.height;
}

- (void)setCms_bottom:(CGFloat)cms_bottom {
    self.y = cms_bottom - self.height;
}

- (CGFloat)cms_left {
    return self.x;
}

- (void)setCms_left:(CGFloat)cms_left {
    self.x = cms_left;
}

- (CGFloat)cms_right {
    return self.x + self.width;
}

- (void)setCms_right:(CGFloat)cms_right {
    self.x = cms_right - self.width;
}

@end

//
//  UIButton+WLAddition.m
//  cosmos
//
//  Created by Lane on 2018/4/23.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UIButton+WLAddition.h"

static char CMSEnlargeTouchAreaEdgeInsetsKey;
static CGSize CMSButtonMinSize = {44, 44};

@implementation UIButton (WLAddition)

- (void)borderWidth:(CGFloat)width borderColor:(CGColorRef)color cornerRadius:(CGFloat)cornerRadius {
    self.layer.borderWidth = width > 0 ? width : 0;
    if (color) {
        self.layer.borderColor = color;
    }
    self.layer.cornerRadius = cornerRadius;
}

- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font {
    [self setTitle:title forState:UIControlStateNormal];
    [self setTintColor:titleColor];
    [self.titleLabel setFont:font];
}

- (void)setImageByName:(NSString *)imageName forState:(UIControlState)state {
    [self setImage:[UIImage imageNamed:imageName] forState:state];
}

// =================== 扩大点击范围 ====================
- (void)enlargeTouchArea {
    [self enlargeTouchAreaToSize:CMSButtonMinSize];
}

- (void)enlargeTouchAreaToSize:(CGSize)size {
    CGFloat top = 0, right = 0, bottom = 0, left = 0;
    if (size.width > self.frame.size.width) {
        left = right = (size.width - self.frame.size.width) / 2;
    }
    if (size.height > self.frame.size.height) {
        top = bottom = (size.height - self.frame.size.height) / 2;
    }
    [self enlargeTouchAreaWithEdgeInsets:UIEdgeInsetsMake(-top, -left, -bottom, -right)];
}

- (void)enlargeTouchAreaWithEdgeInsets:(UIEdgeInsets)edgeInsets {
    NSValue *value = [NSValue valueWithUIEdgeInsets:edgeInsets];
    objc_setAssociatedObject(self, &CMSEnlargeTouchAreaEdgeInsetsKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)enlargedRect {
    UIEdgeInsets hitTestEdgeInsets = UIEdgeInsetsZero;
    NSValue *value = objc_getAssociatedObject(self, &CMSEnlargeTouchAreaEdgeInsetsKey);
    if(value) {
        hitTestEdgeInsets = value.UIEdgeInsetsValue;
    }
    CGRect enlargedRect = UIEdgeInsetsInsetRect(self.bounds, hitTestEdgeInsets);
    CGFloat validWidth = MAX(enlargedRect.size.width, CMSButtonMinSize.width);
    CGFloat validHeight = MAX(enlargedRect.size.height, CMSButtonMinSize.height);
    enlargedRect.size = CGSizeMake(validWidth, validHeight);
    
    return enlargedRect;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = [self enlargedRect];
    if (self.alpha <= 0.01 || self.hidden || !self.userInteractionEnabled || !self.enabled) {
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

// =================== image 和 title 的布局 ====================

- (void)setButtonImagePosition:(CMSButtonImagePosition)postion spacing:(CGFloat)spacing {
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    switch (postion) {
        case CMSButtonImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case CMSButtonImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case CMSButtonImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case CMSButtonImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
            
        default:
            break;
    }
}

@end

//
//  UIButton+WLAddition.h
//  cosmos
//
//  Created by Lane on 2018/4/23.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CMSButtonImagePosition) {
    CMSButtonImagePositionLeft = 0,              //图片在左，文字在右，默认
    CMSButtonImagePositionRight = 1,             //图片在右，文字在左
    CMSButtonImagePositionTop = 2,               //图片在上，文字在下
    CMSButtonImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (WLAddition)

- (void)borderWidth:(CGFloat)width borderColor:(CGColorRef)color cornerRadius:(CGFloat)cornerRadius;

- (void)setTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

- (void)setImageByName:(NSString *)imageName forState:(UIControlState)state;

// =================== 扩大点击范围 ====================
// 增大点击区域, 44*44
- (void)enlargeTouchArea;

// 增大点击区域，size必须大于button的size，否则按button的size计算
- (void)enlargeTouchAreaToSize:(CGSize)size;

// 增大点击区域，top,left,bottom,right必须小于0，否则按0计算
- (void)enlargeTouchAreaWithEdgeInsets:(UIEdgeInsets)edgeInsets;

// =================== image 和 title 的布局 ====================

- (void)setButtonImagePosition:(CMSButtonImagePosition)postion spacing:(CGFloat)spacing;

@end

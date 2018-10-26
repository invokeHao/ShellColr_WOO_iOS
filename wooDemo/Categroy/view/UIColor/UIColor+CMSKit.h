//
//  UIColor+CMSKit.h
//  Cosmos
//
//  Created by Lane on 2018/3/8.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

extern UIColor *woo_colorWithHexString(NSString *str);

extern UIColor *woo_colorWithHexAndAlpha(NSString *str, CGFloat alpha);

@interface UIColor (CMSKit)

+ (UIColor *)woo_colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)woo_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

- (UIImage *)woo_translateToImage;

+ (UIColor*)randomColor;

@end

//
//  UIImage+CMSDrawCircle.h
//  cosmos
//
//  Created by Lane on 2018/7/10.
//  Copyright © 2018 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CMSDrawCircle)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)drawText:(NSString *)text font:(UIFont *)font fontColor:(UIColor *)fontColor;

@end

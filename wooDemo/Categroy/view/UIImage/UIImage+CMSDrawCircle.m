//
//  UIImage+CMSDrawCircle.m
//  cosmos
//
//  Created by Lane on 2018/7/10.
//  Copyright © 2018 Shell&Colr. All rights reserved.
//

#import "UIImage+CMSDrawCircle.h"

@implementation UIImage (CMSDrawCircle)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillEllipseInRect(ctx, rect);
    
    CGContextRestoreGState(ctx);
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)drawText:(NSString *)text font:(UIFont *)font fontColor:(UIColor *)fontColor {
    if (!text || [text isEqualToString:@""]) {
        return self;
    }
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGSize textSize = [text sizeWithAttributes:@{NSFontAttributeName: font}];
    CGFloat x = (self.size.width - textSize.width) * 0.5;
    CGFloat y = (self.size.height - textSize.height) * 0.5;
    CGRect rect = CGRectMake(x, y, textSize.width, textSize.height);
    NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    [text drawInRect:rect withAttributes:@{NSFontAttributeName: (font ? font : [UIFont systemFontOfSize:12]),
                                           NSForegroundColorAttributeName: (fontColor ? fontColor : [UIColor blackColor]),
                                           NSParagraphStyleAttributeName: style
                                           }];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end

//
//  NSString+CMSAttributedString.m
//  cosmos
//
//  Created by Lane on 2018/5/18.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSString+CMSAttributedString.h"

@implementation NSString (CMSAttributedString)

- (NSAttributedString *)attributedStringWithLineSpace:(CGFloat)lineSpace font:(UIFont *)font textColor:(UIColor *)color {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    style.minimumLineHeight = lineSpace;
//    style.maximumLineHeight = lineSpace;
    style.lineSpacing = lineSpace;
    return [[NSAttributedString alloc] initWithString:self attributes:@{NSParagraphStyleAttributeName: style,
                                                                        NSForegroundColorAttributeName: color,
                                                                        NSFontAttributeName: font
                                                                        }];
}

@end

//
//  NSDictionary+CMSAttributes.m
//  cosmos
//
//  Created by 黑眼圈 on 2018/8/9.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSDictionary+CMSAttributes.h"

@implementation NSDictionary (CMSAttributes)

+ (NSDictionary<NSAttributedStringKey, id> *)attributedStringkeyDictionarywithFont:(UIFont *)font
                                                                      andTextColor:(UIColor *)color {
    return @{NSForegroundColorAttributeName: color,
             NSFontAttributeName: font
             };
}


@end

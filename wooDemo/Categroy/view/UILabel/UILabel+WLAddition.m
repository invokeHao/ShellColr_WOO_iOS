//
//  UILabel+WLAddition.m
//  cosmos
//
//  Created by Lane on 2018/4/23.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UILabel+WLAddition.h"

@implementation UILabel (WLAddition)

+ (UILabel *)textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] init];
    if (textColor) {
        [label setTextColor:textColor];
    }
    if (fontSize > 0) {
        [label setFont:[UIFont systemFontOfSize:fontSize]];
    }
    label.textAlignment = alignment;
    return label;
}
@end

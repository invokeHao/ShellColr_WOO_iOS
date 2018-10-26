//
//  NSString+CMSAttributedString.h
//  cosmos
//
//  Created by Lane on 2018/5/18.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CMSAttributedString)

- (NSAttributedString *)attributedStringWithLineSpace:(CGFloat)lineSpace
                                                 font:(UIFont *)font
                                            textColor:(UIColor *)color;

@end

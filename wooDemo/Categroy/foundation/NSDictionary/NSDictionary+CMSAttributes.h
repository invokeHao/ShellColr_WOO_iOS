//
//  NSDictionary+CMSAttributes.h
//  cosmos
//
//  Created by 黑眼圈 on 2018/8/9.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (CMSAttributes)

+ (NSDictionary<NSAttributedStringKey, id> *)attributedStringkeyDictionarywithFont:(UIFont *)font
                                                                      andTextColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END

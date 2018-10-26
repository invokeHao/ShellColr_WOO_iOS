//
//  NSString+extention.h
//  Yizhenapp
//
//  Created by augbase on 16/5/14.
//  Copyright © 2016年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extention)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGSize)sizeWithWordWrapFont:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSString *)sha1:(NSString *)input;


+ (id)toArrayOrNSDictionary:(NSString*)NOjsonString;

// 饭票逗号分开
+ (NSMutableString*)getTheMutableStringWithInteger:(NSInteger)num;

// 饭票显示单位
+ (NSString *)getTheUnitStringWithInteger:(NSInteger)num;

// 删除link中部分参数
+ (NSString *)deleteSpecificUrlQuery:(NSArray *)array andUrl:(NSString *)url;


@end

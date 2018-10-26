//
//  NSUserDefaults+CMSData.h
//  cosmos
//
//  Created by colr on 2018/6/14.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (CMSData)

+ (void)saveBoolValue:(BOOL)data forKey:(NSString *)key;
+ (BOOL)fetchBoolValueWithKey:(NSString *)key;

@end

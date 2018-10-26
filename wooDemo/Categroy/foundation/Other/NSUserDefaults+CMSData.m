//
//  NSUserDefaults+CMSData.m
//  cosmos
//
//  Created by colr on 2018/6/14.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSUserDefaults+CMSData.h"

@implementation NSUserDefaults (CMSData)

+ (void)saveBoolValue:(BOOL)data forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:data forKey:key];
    [defaults synchronize];
}

+ (BOOL)fetchBoolValueWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}

@end

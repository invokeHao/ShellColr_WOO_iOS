//
//  NSNotificationCenter+CMSExtension.m
//  cosmos
//
//  Created by 周凌宇 on 2018/5/9.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSNotificationCenter+CMSExtension.h"

@implementation NSNotificationCenter (CMSExtension)

+ (void)postNotificationName:(NSNotificationName)aName {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:aName object:nil];
    });
}

@end

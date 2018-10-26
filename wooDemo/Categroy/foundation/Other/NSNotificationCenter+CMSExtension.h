//
//  NSNotificationCenter+CMSExtension.h
//  cosmos
//
//  Created by 周凌宇 on 2018/5/9.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (CMSExtension)

// 默认回到主线程发通知

+ (void)postNotificationName:(NSNotificationName)aName;

@end

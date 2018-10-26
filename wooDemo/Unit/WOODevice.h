//
//  WOODevice.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOODevice : NSObject

+ (BOOL)isPad;

+ (NSString *)iphoneType;

+ (BOOL)is_iPhoneX;


+ (BOOL)isIOS6OrLater;
+ (BOOL)isIOS6Befor;
+ (BOOL)isIOS7;
+ (BOOL)isIOS7OrLater;
+ (BOOL)isIOS7Befor;
+ (BOOL)isIOS8OrLater;
+ (BOOL)isIOS8Befor;
+ (BOOL)isIPad;
+ (BOOL)isIPhone5Later;
+ (BOOL)isIPhone6Later;
+ (BOOL)is64bit;
+ (BOOL)isIOS9OrLater;
+ (BOOL)isIOS10OrLater;
+ (BOOL)isIOS11OrLater;

+ (BOOL)isIPhone4ORLess;
+ (BOOL)isIPhone5;
+ (BOOL)isIPhone6;
+ (BOOL)isIphone6P;
+ (BOOL)isIpadPro;
+ (BOOL)isIPhoneX;

@end

NS_ASSUME_NONNULL_END

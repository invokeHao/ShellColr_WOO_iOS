//
//  WOOServiceGlobalConfig.h
//  cosmos
//
//  Created by Lane on 2018/3/30.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOServiceConstant.h"

typedef NS_ENUM(NSInteger, WOOServiceGlobalConfigType) {
    WOOServiceGlobalConfigTypeDevelop = 0,
    WOOServiceGlobalConfigTypeAlpha,
    WOOServiceGlobalConfigTypeBeta,
    WOOServiceGlobalConfigTypeLive
};

@interface WOOServiceGlobalConfig : NSObject

@property (nonatomic, copy) NSString *apiDomain;

+ (instancetype)shareInstance;

- (void)apiEnvironment:(WOOServiceGlobalConfigType)type;

@end

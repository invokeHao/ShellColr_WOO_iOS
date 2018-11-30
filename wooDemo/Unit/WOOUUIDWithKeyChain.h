//
//  WOOUUIDWithKeyChain.h
//  wooDemo
//
//  Created by colr on 2018/11/21.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOOUUIDWithKeyChain : NSObject

+(NSString *)getUUID;

@end


@interface KeyChainStore : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;

@end


NS_ASSUME_NONNULL_END

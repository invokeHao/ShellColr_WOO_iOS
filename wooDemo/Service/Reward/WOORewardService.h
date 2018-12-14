//
//  WOORewardService.h
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOORewardModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOORewardService : NSObject

+ (void)getTheRewardListStartIndex:(NSInteger)startIndex
                        Completion:(void (^)(NSArray<WOORewardRow *> * rows, NSError * error))completion;

+ (void)getTheRewardDetailWithRewardId:(NSString *)rewardId
                            completion:(void (^)(WOORewardRow * row, NSError * error))completion;


+ (void)postARewardWithParamDic:(NSDictionary *)paramDic
                     completion:(void (^)(WOORewardRow * row, NSError * error))completion;

+ (void)getTheRewardPayedWithOrderId:(NSString *)OrderId
                           completion:(void (^)(BOOL isSuccess, NSError * error))completion;

@end

NS_ASSUME_NONNULL_END

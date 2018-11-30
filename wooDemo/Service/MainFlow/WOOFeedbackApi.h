//
//  WOOFeedbackApi.h
//  wooDemo
//
//  Created by colr on 2018/11/21.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOOFeedbackApi : NSObject

+ (void)postTheReadLogWithDataDic:(NSDictionary *)dataDic
                       completion:(void (^)(BOOL success, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END

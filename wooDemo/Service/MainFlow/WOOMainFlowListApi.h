//
//  WOOMainFlowListApi.h
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOMainFlowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOMainFlowListApi : NSObject

+ (void)getTheMainFlowListWithDictionary:(NSDictionary*)paramDic
                       completion:(void (^)(WOOMainFlowModel *model, NSError * error))completion;

@end

NS_ASSUME_NONNULL_END

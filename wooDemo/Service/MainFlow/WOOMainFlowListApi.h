//
//  WOOMainFlowListApi.h
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOMainFlowModel.h"
#import "WOOMainVideoModel.h"
#import "WOOGoodsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOMainFlowListApi : NSObject

+ (void)getTheMainFlowListWithPath:(NSString *)path
                        Dictionary:(NSDictionary*)paramDic
                       completion:(void (^)(WOOMainFlowModel *model, NSError * error))completion;

+ (void)getTheDetailDataWithItemID:(NSString *)ItemId
                        completion:(void (^)(NSString *htmlStr, NSError *error))completion;

+ (void)getTheDetailVideoUrlWithVideoId:(NSString *)videoId
                             completion:(void (^)(WOOMainVideoModel * model, NSError * error))completion;

+ (void)getTheGoodsFlowCompletion:(void (^)(NSArray <WOOGoodsModel *>* array, NSError * error))completion;

+ (void)getTheGoodsDetailWithGoodsId:(NSString *)goodsId
                             completion:(void (^)(WOOGoodsModel * model, NSError * error))completion;

@end

NS_ASSUME_NONNULL_END

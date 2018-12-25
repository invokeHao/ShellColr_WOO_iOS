//
//  WOOFavoriteService.h
//  wooDemo
//
//  Created by colr on 2018/12/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOGoodsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOFavoriteService : NSObject

+ (void)getTheFavoriteListWithStartIndex:(NSInteger)startIndex
                              completion:(void (^)(NSArray<WOOGoodsModel *> * array, NSError * error))completion;

+ (void)postTheFavoriteWithArticleId:(NSString *)articleId
                          completion:(void (^)(BOOL isSuccess, NSError * error))completion;

@end

NS_ASSUME_NONNULL_END

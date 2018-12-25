//
//  WOOMyFavoriteVM.h
//  wooDemo
//
//  Created by colr on 2018/12/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOFavoriteService.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOMyFavoriteVM : NSObject

@property (strong, nonatomic, readonly)NSArray<WOOGoodsModel*> * dataList;

- (void)fetchTheGoodsFavoriteListWithRefreshType:(WOORefreshType)refreshType;

@end

NS_ASSUME_NONNULL_END

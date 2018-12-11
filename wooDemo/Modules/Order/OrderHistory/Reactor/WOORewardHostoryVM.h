//
//  WOORewardHostoryVM.h
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOORewardService.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOORewardHostoryVM : NSObject

@property (strong, nonatomic, readonly)NSArray<WOORewardRow*> * dataList;

- (void)fetchRewardHistoryListWithRefreshType:(WOORefreshType)refreshType;

@end

NS_ASSUME_NONNULL_END

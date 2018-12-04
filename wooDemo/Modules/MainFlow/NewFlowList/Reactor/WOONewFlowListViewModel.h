//
//  WOONewFlowListViewModel.h
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOONewListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOONewFlowListViewModel : NSObject

@property (strong, nonatomic, readonly)NSArray<WOONewListModel *> * dataList;

@property (strong, nonatomic, readonly)RACSubject *errorSubject;

- (void)fetchMainFlowListWithRefreshType:(WOORefreshType)refreshType;

@end

NS_ASSUME_NONNULL_END

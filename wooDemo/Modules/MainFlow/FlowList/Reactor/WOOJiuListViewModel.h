//
//  WOOJiuListViewModel.h
//  wooDemo
//
//  Created by colr on 2018/11/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOJiuListDemoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOJiuListViewModel : NSObject

@property (strong, nonatomic, readonly)NSArray<WOOArticleModel *> * dataList;

- (void)fetchMainFlowListWithRefreshType:(WOORefreshType)refreshType;


@end

NS_ASSUME_NONNULL_END

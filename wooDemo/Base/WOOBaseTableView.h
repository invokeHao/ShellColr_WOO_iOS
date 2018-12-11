//
//  WOOBaseTableView.h
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^EmptyDataSetTappedBlock)(void);

@interface WOOBaseTableView : UITableView

@property (nonatomic, strong) MJRefreshComponentRefreshingBlock headerRefreshingBlock;
@property (nonatomic, copy) MJRefreshComponentRefreshingBlock footerRefreshingBlock;
@property (nonatomic, copy) EmptyDataSetTappedBlock emptyDataSetTappedBlock;

@end

NS_ASSUME_NONNULL_END

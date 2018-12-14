//
//  WOONewFlowListVC.h
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseViewController.h"
#import "WOONewListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOONewFlowListVC : WOOBaseViewController

- (void)refreshTheFlowData;

- (void)getMoreDataWithDisPlayModel:(WOONewListModel *)model;

@end

NS_ASSUME_NONNULL_END

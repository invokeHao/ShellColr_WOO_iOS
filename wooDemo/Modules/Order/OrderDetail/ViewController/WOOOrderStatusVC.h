//
//  WOOOrderStatusVC.h
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseViewController.h"
#import "WOORewardRow.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOOrderStatusVC : WOOBaseViewController

@property (nonatomic, strong)WOORewardRow * model;

@property (nonatomic, assign)BOOL toCheckTheOrder;

@end

NS_ASSUME_NONNULL_END

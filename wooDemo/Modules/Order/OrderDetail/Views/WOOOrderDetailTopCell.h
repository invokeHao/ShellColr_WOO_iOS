//
//  WOOOrderDetailTopView.h
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseTableViewCell.h"
#import "WOORewardRow.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOOrderDetailTopCell : WOOBaseTableViewCell

@property (nonatomic, assign)WOOOrderStatusType OrderType;

@property (nonatomic, strong)WOOFetchSubject * paySubject;

@end

NS_ASSUME_NONNULL_END

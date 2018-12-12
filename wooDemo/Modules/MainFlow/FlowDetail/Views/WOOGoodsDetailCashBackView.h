//
//  WOOGoodsDetailCashBackView.h
//  wooDemo
//
//  Created by colr on 2018/11/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WOOGoodsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOGoodsDetailCashBackView : UIView

@property (nonatomic, strong)WOOGoodsModel * model;

@property (nonatomic, strong)WOOFetchSubject * rewardSubject;

@end

NS_ASSUME_NONNULL_END

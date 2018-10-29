//
//  WOOInsJiuCell.h
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseCollectionViewCell.h"
#import "WOOBaseCollectionView.h"
#import "WOOJIuDemoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOInsJiuCell : WOOBaseCollectionViewCell

@property (strong, nonatomic)WOOJIuDemoModel * model;

@property (strong, nonatomic)WOOBaseCollectionView * JiuCollectionView;

- (void)setModel:(WOOJIuDemoModel * _Nonnull)model;

@end

NS_ASSUME_NONNULL_END

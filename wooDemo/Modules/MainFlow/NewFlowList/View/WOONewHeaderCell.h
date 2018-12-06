//
//  WOONewHeaderCell.h
//  wooDemo
//
//  Created by colr on 2018/12/6.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOONewHeaderCell : WOOBaseCollectionViewCell

@property (nonatomic, strong)UILabel * dateLabel;

- (void)showTheDate;

- (void)hidenTheDate;

@end

NS_ASSUME_NONNULL_END

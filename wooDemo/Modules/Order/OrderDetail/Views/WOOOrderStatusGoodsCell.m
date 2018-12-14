//
//  WOOOrderStatusGoodsCell.m
//  wooDemo
//
//  Created by colr on 2018/12/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOOrderStatusGoodsCell.h"
#import "WOOGoodsView.h"

@interface WOOOrderStatusGoodsCell()

@property (nonatomic, strong)WOOGoodsView * goodsView;

@end

@implementation WOOOrderStatusGoodsCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.goodsView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)setModel:(WOORewardRow *)model {
    if (model) {
        [self.goodsView setModel:model];
    }
}

- (WOOGoodsView *)goodsView {
    if (!_goodsView) {
        _goodsView = [[WOOGoodsView alloc]initWithFrame:CGRectZero];
    }
    return _goodsView;
}


@end

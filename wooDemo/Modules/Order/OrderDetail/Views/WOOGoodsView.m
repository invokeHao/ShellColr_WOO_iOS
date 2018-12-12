//
//  WOOGoodsView.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOGoodsView.h"


@interface WOOGoodsView()

@property (nonatomic, strong)YYAnimatedImageView * goodsIconV;

@property (nonatomic, strong)UILabel * goodsNameLabel;

@property (nonatomic, strong)UILabel * goodsRewardLabel;

@property (nonatomic, strong)UILabel * goodsPriceLabel;

@property (nonatomic, strong)UILabel * goodsCoinLabel;

@end

@implementation WOOGoodsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubviewArray:@[self.goodsIconV,self.goodsNameLabel,self.goodsRewardLabel,self.goodsPriceLabel,self.goodsCoinLabel]];
}

- (void)layoutSubviews {
    [self.goodsIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.goodsIconV.mas_top).offset(4);
        make.left.mas_equalTo(self.goodsIconV.mas_right).offset(26);
        make.height.mas_equalTo(17);
    }];
    
    [self.goodsRewardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsNameLabel);
        make.top.mas_equalTo(self.goodsNameLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(17);
    }];
    
    [self.goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsNameLabel);
        make.top.mas_equalTo(self.goodsRewardLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(17);
    }];
    
    [self.goodsCoinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsNameLabel);
        make.top.mas_equalTo(self.goodsPriceLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(17);
    }];
}

- (void)setModel:(WOORewardRow *)model {
    if (model) {
        NSString * imageStr = model.productImage.url;
        if (!imageStr) {
            imageStr = @"https://img13.360buyimg.com/babel/s320x320_jfs/t25333/286/1148627644/132468/e935cde5/5b8df4e1Nfdcae39e.jpg";
        }
        [self.goodsIconV yy_setImageWithURL:[NSURL URLWithString:imageStr] options:YYWebImageOptionProgressive];
        [self.goodsNameLabel setText:model.productName];
        [self.goodsRewardLabel setText:FORMAT(@"返利：     ¥%ld.00",(long)model.rewardAmount)];
        [self.goodsPriceLabel setText:FORMAT(@"原价：  ¥%ld.00",(long)model.priceAmount)];
        [self.goodsCoinLabel setText:FORMAT(@"花费注意力： ¥%ld.00",(long)model.payCoinAmount)];
    }
}

- (YYAnimatedImageView *)goodsIconV {
    if (!_goodsIconV) {
        _goodsIconV = [[YYAnimatedImageView alloc]init];
        _goodsIconV.layer.cornerRadius = 12;
        _goodsIconV.contentMode = UIViewContentModeScaleAspectFit;
        _goodsIconV.clipsToBounds = YES;
    }
    return _goodsIconV;
}

- (UILabel *)goodsNameLabel {
    if (!_goodsNameLabel) {
        _goodsNameLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#444444"));
    }
    return _goodsNameLabel;
}

- (UILabel *)goodsRewardLabel {
    if (!_goodsRewardLabel) {
        _goodsRewardLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#444444"));
    }
    return _goodsRewardLabel;
}

- (UILabel *)goodsPriceLabel {
    if (!_goodsPriceLabel) {
        _goodsPriceLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#444444"));
    }
    return _goodsPriceLabel;
}

- (UILabel *)goodsCoinLabel {
    if (!_goodsCoinLabel) {
        _goodsCoinLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#444444"));
    }
    return _goodsCoinLabel;
}


@end

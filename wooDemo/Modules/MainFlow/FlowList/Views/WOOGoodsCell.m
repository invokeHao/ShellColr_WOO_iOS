//
//  WOOGoodsCell.m
//  wooDemo
//
//  Created by colr on 2018/11/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOGoodsCell.h"

@interface WOOGoodsCell()

@property (nonatomic, strong)UILabel * priceLabel;

@property (strong, nonatomic)UIView * maskView;

@property (nonatomic, strong)YYAnimatedImageView * coverImageV;

@property (nonatomic, strong)UIImageView * iconView;

@end

@implementation WOOGoodsCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self.contentView addSubview:self.coverImageV];
    [self.contentView addSubview:self.maskView];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.iconView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.coverImageV);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4);
        make.right.mas_equalTo(-4);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(6);
        make.bottom.mas_equalTo(-6);
        make.right.mas_equalTo(-6);
    }];
    [self configTheLayer];
}

- (void)configTheLayer {
    self.coverImageV.layer.cornerRadius = 15;
    self.maskView.layer.cornerRadius = 15;
    self.layer.cornerRadius = 15;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowColor = woo_colorWithHexAndAlpha(@"000000", 0.2).CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 2;
    
    NSArray * colorArr = @[woo_colorWithHexAndAlpha(@"000000", 0.0),woo_colorWithHexAndAlpha(@"000000", 0.4)];
    [_maskView setGradientBackgroundWithColors:colorArr locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
}


-(void)setModel:(WOOGoodsModel *)model {
    if (model) {
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:model.goodsCoverUrl] options:YYWebImageOptionProgressive];
        NSString * priceStr = FORMAT(@"¥%@",model.goodsPrice);
        self.priceLabel.text = priceStr;
        _model = model;
    }
}


- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = UILabel.label.WH_font(WOOFont(13)).WH_textColor([UIColor whiteColor]).WH_textAlignment(NSTextAlignmentRight);
    }
    return _priceLabel;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
        _iconView.image = [UIImage imageNamed:@"shop"];
    }
    return _iconView;
}

- (YYAnimatedImageView *)coverImageV {
    if (!_coverImageV) {
        _coverImageV = [[YYAnimatedImageView alloc]init];
        _coverImageV.contentMode = UIViewContentModeScaleAspectFill;
        _coverImageV.backgroundColor = woo_colorWithHexString(@"D8D8D8");
        _coverImageV.clipsToBounds = YES;
    }
    return _coverImageV;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc]init];
    }
    return _maskView;
}

@end

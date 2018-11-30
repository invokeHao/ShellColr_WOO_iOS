//
//  WOOGoodsDetailTopView.m
//  wooDemo
//
//  Created by colr on 2018/11/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOGoodsDetailTopView.h"

@interface WOOGoodsDetailTopView()

@property (nonatomic, strong)YYAnimatedImageView * coverImageV;

@property (nonatomic, strong)UIView * maskView;

@property (nonatomic, strong)UIButton * detailBtn;

@property (nonatomic, strong)UILabel * priceLabel;

@property (nonatomic, strong)UILabel * titleLabel;

@end

@implementation WOOGoodsDetailTopView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.coverImageV];
    [self addSubview:self.maskView];
    [self.maskView addSubview:self.detailBtn];
    [self.maskView addSubview:self.priceLabel];
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat coverH = 360 * VERTICAL_SCREEN_WIDTH / 414;
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(coverH);
    }];
    
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.coverImageV);
    }];
    
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.bottom.mas_equalTo(-18);
        make.size.mas_equalTo(CGSizeMake(68, 28));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.bottom.mas_equalTo(-20);
        make.height.mas_equalTo(32);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.coverImageV.mas_bottom).offset(20);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
    }];
    
    self.layer.cornerRadius = 18;
    self.clipsToBounds = YES;
    
    NSArray * colorArr = @[woo_colorWithHexAndAlpha(@"000000", 0.0),woo_colorWithHexAndAlpha(@"000000", 0.4)];
    [_maskView setGradientBackgroundWithColors:colorArr locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];

}

- (void)setModel:(WOOGoodsModel *)model {
    if (model) {
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:model.goodsCoverUrl] options:YYWebImageOptionProgressive];
        NSString * priceStr = FORMAT(@"¥%@",model.goodsPrice);
        self.priceLabel.text = priceStr;
        self.titleLabel.text = model.goodsName;
    }
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = UILabel.label.WH_font(WOOFont(26)).WH_textColor([UIColor whiteColor]).WH_textAlignment(NSTextAlignmentRight);
    }
    return _priceLabel;
}

- (YYAnimatedImageView *)coverImageV {
    if (!_coverImageV) {
        _coverImageV = [[YYAnimatedImageView alloc]init];
        _coverImageV.contentMode = UIViewContentModeScaleAspectFill;
        _coverImageV.backgroundColor = woo_colorWithHexString(@"D8D8D8");
    }
    return _coverImageV;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc]init];
    }
    return _maskView;
}

- (UIButton *)detailBtn {
    if (!_detailBtn) {
        _detailBtn = UIButton.button.WH_setTitle_forState(@"详情",UIControlStateNormal).WH_titleLabel_font(WOOFont(13)).WH_setTitleColor_forState(woo_colorWithHexString(@"333333"),UIControlStateNormal);
        _detailBtn.backgroundColor = [UIColor whiteColor];
        _detailBtn.layer.cornerRadius = 14;
        _detailBtn.clipsToBounds = YES;
    }
    return _detailBtn;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(24)).WH_textColor(woo_colorWithHexString(@"222222")).WH_numberOfLines(3);
    }
    return _titleLabel;
}

@end

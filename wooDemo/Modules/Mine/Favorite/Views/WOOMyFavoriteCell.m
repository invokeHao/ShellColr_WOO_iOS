//
//  WOOMyFavoriteCell.m
//  wooDemo
//
//  Created by colr on 2018/12/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMyFavoriteCell.h"

@interface WOOMyFavoriteCell ()

@property (nonatomic, strong)YYAnimatedImageView * coverImageV;

@property (nonatomic, strong)UIView * backMaskView;

@property (nonatomic, strong)UIImageView * iconView;

@property (nonatomic, strong)UILabel * priceLabel;

@end

@implementation WOOMyFavoriteCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.coverImageV];
    [self.coverImageV addSubviewArray:@[self.backMaskView,self.iconView,self.priceLabel]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.backMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-8);
        make.size.mas_equalTo(CGSizeMake(21, 22));
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-8);
        make.bottom.mas_equalTo(-8);
        make.height.mas_equalTo(15);
    }];
    [self configTheLayer];
}

- (void)configTheLayer {
    self.coverImageV.layer.cornerRadius = 12;
    self.backMaskView.layer.cornerRadius = 12;
    self.layer.cornerRadius = 12;
    self.coverImageV.clipsToBounds = YES;
    NSArray * colorArr = @[woo_colorWithHexAndAlpha(@"000000", 0.0),woo_colorWithHexAndAlpha(@"000000", 1)];
    [_backMaskView setGradientBackgroundWithColors:colorArr locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
}


- (void)setModel:(WOOGoodsModel *)model {
    if (model) {
        NSString * imageStr = nil;
        WOOImage * image = [model.multiBodyText.images firstObject];
        imageStr = image.url;
        if (!imageStr) {
            imageStr = @"https://img13.360buyimg.com/babel/s320x320_jfs/t25333/286/1148627644/132468/e935cde5/5b8df4e1Nfdcae39e.jpg";
        }
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:imageStr] options:YYWebImageOptionProgressive];
        [self.iconView setImage:WOOImageNamed(@"shop")];
        [self.priceLabel setText:FORMAT(@"¥%ld",model.productPriceAmount)];
    }
}

- (YYAnimatedImageView *)coverImageV {
    if (!_coverImageV) {
        _coverImageV = [[YYAnimatedImageView alloc]init];
        _coverImageV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _coverImageV;
}

- (UIView *)backMaskView {
    if (!_backMaskView) {
        _backMaskView = [[UIView alloc]init];
    }
    return _backMaskView;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
    }
    return _iconView;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = UILabel.label.WH_font(WOOFont(14)).WH_textColor([UIColor whiteColor]).WH_textAlignment(NSTextAlignmentRight);
    }
    return _priceLabel;
}


@end

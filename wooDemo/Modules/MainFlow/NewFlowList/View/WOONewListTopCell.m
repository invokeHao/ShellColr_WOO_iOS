//
//  WOONewListTopCell.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewListTopCell.h"

@interface WOONewListTopCell ()

@property (strong, nonatomic)YYAnimatedImageView * coverImageV;

@property (strong, nonatomic)UIImageView * iconView;

@property (strong, nonatomic)UILabel * titleLabel;

@end

@implementation WOONewListTopCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.coverImageV];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat KTopH = 135 * VERTICAL_SCREEN_WIDTH / 375;
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(KTopH);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4);
        make.right.mas_equalTo(-4);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.coverImageV.mas_bottom).offset(14);
        make.left.mas_equalTo(14);
        make.right.mas_equalTo(-14);
    }];
    
    [self configTheLayer];
}

- (void)configTheLayer {
    [self.coverImageV roundCorner:UIRectCornerTopLeft|UIRectCornerTopRight radius:10];
    self.layer.cornerRadius = 10;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowColor = woo_colorWithHexAndAlpha(@"000000", 0.2).CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 2;
}


- (void)setModel:(WOOArticleModel *)model {
    if (model) {
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:model.middle_image] options:YYWebImageOptionProgressive];
        self.titleLabel.attributedText = [model.title attributedStringWithLineSpace:1.5 fontSpace:1.0f];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        if (model.has_video) {
            [self.iconView setImage:[UIImage imageNamed:@"play_button"]];
        }else {
            [self.iconView setImage:[UIImage imageNamed:@"article"]];
        }
        if (model.isBigCell) {
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(10);
            }];
        }
    }
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

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
        _iconView.alpha = 0.8;
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(15)).WH_textColor(woo_colorWithHexString(@"#171F24  ")).WH_numberOfLines(3);
    }
    return _titleLabel;
}


@end

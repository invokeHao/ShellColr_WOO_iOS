//
//  WOOHotVideoCell.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOHotVideoCell.h"

@interface WOOHotVideoCell ()

@property (strong, nonatomic)YYAnimatedImageView * coverImageV;

@property (strong, nonatomic)UIImageView * iconView;

@property (strong, nonatomic)UIView * maskView;

@property (strong, nonatomic)UIImageView * videoIcon;

@property (strong, nonatomic)UILabel * titleLabel;

@end

@implementation WOOHotVideoCell

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
    [self.contentView addSubview:self.videoIcon];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4);
        make.right.mas_equalTo(-4);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    
    [self.videoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(22, 22));
    }];
    
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.bottom.mas_equalTo(-15);
        make.right.mas_equalTo(-15);
    }];
    
    [self configTheLayer];
}

- (void)configTheLayer {
    self.coverImageV.layer.cornerRadius = 10;
    self.maskView.layer.cornerRadius = 10;
    self.layer.cornerRadius = 10;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowColor = woo_colorWithHexAndAlpha(@"000000", 0.2).CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 2;
    
    NSArray * colorArr = @[woo_colorWithHexAndAlpha(@"000000", 0.0),woo_colorWithHexAndAlpha(@"000000", 0.4)];
    [_maskView setGradientBackgroundWithColors:colorArr locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
}


- (void)setModel:(WOOArticleModel *)model {
    if (model) {
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:model.middle_image] options:YYWebImageOptionProgressive];
        self.videoIcon.hidden = !model.has_video;
        self.videoIcon.hidden = YES;
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

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc]init];
    }
    return _maskView;
}

- (UIImageView *)videoIcon {
    if (!_videoIcon) {
        _videoIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"play_button"]];
        _videoIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _videoIcon;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(13)).WH_textColor([UIColor whiteColor]).WH_numberOfLines(2);
    }
    return _titleLabel;
}

@end

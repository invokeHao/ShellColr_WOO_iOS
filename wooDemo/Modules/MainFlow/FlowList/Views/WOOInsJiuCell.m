//
//  WOOInsJiuCell.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuCell.h"

@interface WOOInsJiuCell ()

@property (strong, nonatomic)YYAnimatedImageView * coverImageV;

@property (strong, nonatomic)UIImageView * iconView;

@property (strong, nonatomic)UIView * maskView;

@property (strong, nonatomic)UIImageView * videoIcon;

@property (strong, nonatomic)UILabel * titleLabel;

@end

@implementation WOOInsJiuCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        [self laySubviews];
    }
    return self;
}

- (void)setupView {
    [self.contentView addSubview:self.JiuCollectionView];
    [self.contentView addSubview:self.coverImageV];
    [self.contentView addSubview:self.maskView];
    [self.contentView addSubview:self.videoIcon];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLabel];
}

- (void)laySubviews {
//    [super layoutSubviews];
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

- (WOOBaseCollectionView *)JiuCollectionView {
    if (!_JiuCollectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _JiuCollectionView = [[WOOBaseCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_JiuCollectionView setBackgroundColor:[UIColor clearColor]];
        [_JiuCollectionView setAlwaysBounceVertical:NO];
        [_JiuCollectionView setAlwaysBounceHorizontal:YES];
        [_JiuCollectionView setShowsHorizontalScrollIndicator:NO];
    }
    return _JiuCollectionView;
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

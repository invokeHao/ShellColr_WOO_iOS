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

@end

@implementation WOOInsJiuCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self.contentView addSubview:self.JiuCollectionView];
    [self.contentView addSubview:self.coverImageV];
    [self.contentView addSubview:self.iconView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.coverImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4);
        make.right.mas_equalTo(-4);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    self.contentView.layer.cornerRadius = 6;
    self.contentView.clipsToBounds = YES;
}

- (void)setModel:(WOOArticleModel *)model {
    if (model) {
        [self.coverImageV yy_setImageWithURL:[NSURL URLWithString:model.middle_image] options:YYWebImageOptionProgressive];
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
    }
    return _coverImageV;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
    }
    return _iconView;
}

@end

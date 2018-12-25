//
//  WOOMinePageCell.m
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMinePageCell.h"

@interface WOOMinePageCell ()

@property (nonatomic, strong)UIImageView * iconView;

@property (nonatomic, strong)UILabel * nameLabel;

@property (nonatomic, strong)UIImageView * moreView;

@end

@implementation WOOMinePageCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubviewArray:@[self.iconView,self.nameLabel,self.moreView]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(32);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(32);
        make.centerY.mas_equalTo(self.iconView);
        make.height.mas_equalTo(22);
    }];
    
    [self.moreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.centerY.mas_equalTo(self.iconView);
        make.size.mas_equalTo(CGSizeMake(10, 16));
    }];
}


- (void)setModel:(WOOMineBasicModel *)model {
    if (model) {
        [self.iconView setImage:WOOImageNamed(model.iconName)];
        [self.nameLabel setText:model.titleName];
    }
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = UIImageView.imageView;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = UILabel.label.WH_font(WOOFont(16)).WH_textColor(woo_colorWithHexString(@"5C5C5C"));
    }
    return _nameLabel;
}

- (UIImageView *)moreView {
    if (!_moreView) {
        _moreView = UIImageView.imageView.WH_image(WOOImageNamed(@"more"));
    }
    return _moreView;
}

@end

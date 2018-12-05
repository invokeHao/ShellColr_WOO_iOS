//
//  WOOBottomTextOnlyCell.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBottomTextOnlyCell.h"

@interface WOOBottomTextOnlyCell()

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)UILabel * abstractLabel;

@end

@implementation WOOBottomTextOnlyCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.abstractLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(12);
        make.right.mas_equalTo(-15);
    }];
    
    [self.abstractLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(6);
    }];
}

- (void)setModel:(WOOArticleModel *)model {
    if (model) {
        self.titleLabel.attributedText = [model.title attributedStringWithLineSpace:2 fontSpace:1.5f];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.abstractLabel.attributedText = [model.abstract attributedStringWithLineSpace:2 fontSpace:1.5f];
        self.abstractLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(16)).WH_textColor(woo_colorWithHexString(@"#222222")).WH_numberOfLines(2);
    }
    return _titleLabel;
}

- (UILabel *)abstractLabel {
    if (!_abstractLabel) {
        _abstractLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#222222")).WH_numberOfLines(2);
    }
    return _abstractLabel;
}

@end

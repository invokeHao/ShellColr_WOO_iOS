//
//  WOOAgreeBtnView.m
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOAgreeBtnView.h"

@interface WOOAgreeBtnView()

@property (nonatomic, strong)UIView * backView;

@property (nonatomic, strong)UILabel * readLabel;

@property (nonatomic, strong)UILabel * agreeLabel;

@end

@implementation WOOAgreeBtnView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    [self addSubview:self.backView];
    [self.backView addSubviewArray:@[self.readLabel,self.agreeLabel]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(200, 17));
    }];
    [self.readLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(self.backView);
        make.height.mas_equalTo(13);
    }];
    [self.agreeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.readLabel.mas_right).offset(1);
        make.centerY.mas_equalTo(self.readLabel);
        make.height.mas_equalTo(self.readLabel);
    }];
}

-(UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc]init];
    }
    return _backView;
}

- (UILabel *)readLabel {
    if (!_readLabel) {
        _readLabel = UILabel.label.WH_font(WOOFont(12)).WH_text(@"已阅读并同意").WH_textColor(woo_colorWithHexString(@"#4F4F4F"));
    }
    return _readLabel;
}

- (UILabel *)agreeLabel {
    if (!_agreeLabel) {
        _agreeLabel = UILabel.label.WH_font(WOOFont(12)).WH_textColor(woo_colorWithHexString(@"#4A90E2")).WH_text(@"《采色用户协议》");
    }
    return _agreeLabel;
}

@end

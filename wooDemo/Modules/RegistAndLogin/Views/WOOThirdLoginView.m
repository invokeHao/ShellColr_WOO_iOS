//
//  WOOThirdLoginView.m
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOThirdLoginView.h"

@interface WOOThirdLoginView()

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)UIView * loginView;

@end

@implementation WOOThirdLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        [self layoutViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.loginView];
}

- (void)layoutViews {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(190, 35));
        make.centerX.mas_equalTo(self);
    }];
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(H_SCALE(88));
        make.centerX.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(205, 35));
    }];
    
    [self setupLoginView];
}

- (void)selectedToLogin:(UIButton*)button {
    NSLog(@"%ld",button.tag);
    [WOOHud showString:@"暂时只支持短线验证码登录"];
}

- (void)setupLoginView {
    NSArray * imageStr = @[@"ico_wechat",@"ico_weibo",@"ico_qq_social"];
    for (int i = 0; i < 3; i++) {
        UIButton * button = UIButton.button.WH_setImage_forState(WOOImageNamed(imageStr[i]),UIControlStateNormal);
        button.tag = i;
        [button addTarget:self action:@selector(selectedToLogin:) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake(i*(50+35), 0, 35, 35)];
        [self.loginView addSubview:button];
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOMFont(24)).WH_text(@"第三方授权登录").WH_textColor(woo_colorWithHexString(@"#333333")).WH_textAlignment(NSTextAlignmentCenter);
    }
    return _titleLabel;
}

- (UIView *)loginView {
    if (!_loginView) {
        _loginView = [[UIView alloc]init];
    }
    return _loginView;
}



@end

//
//  WOOLoginViewController.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOLoginViewController.h"
#import "WOOThirdLoginView.h"
#import "WOOPhoneLoginView.h"
#import "WOOCrossView.h"
#import "WOOAgreeBtnView.h"

@interface WOOLoginViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) WOOThirdLoginView * thirdLoginView;
@property (nonatomic, strong) WOOPhoneLoginView * phoneLoginView;
@property (nonatomic, strong) WOOCrossView * crossView;
@property (nonatomic, strong) WOOAgreeBtnView * agreeView;


@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) UIButton * closeBtn;

@end

@implementation WOOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupConstraint];
    [self bindEvents];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.hidden = YES;
}

- (void)setupView {
    self.view.backgroundColor = woo_colorWithHexString(@"#FAFAFA");
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.closeBtn];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.headerView];
    [self.contentView addSubview:self.thirdLoginView];
    [self.contentView addSubview:self.crossView];
    [self.contentView addSubview:self.phoneLoginView];
    [self.contentView addSubview:self.agreeView];
}

- (void)setupConstraint {
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(STATUS_BAR_HEIGHT + 6);
        make.size.mas_equalTo(CGSizeMake(40, 32));
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(NAVIGATION_BAR_HEIGHT);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.trailing.equalTo(self.view.mas_trailing).offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-0);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.top.equalTo(self.headerView);
        make.bottom.equalTo(self.agreeView.mas_bottom).offset(20);
    }];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(42);
    }];
    
    [self.thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(0);
        make.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(208);
    }];
    
    [self.crossView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.thirdLoginView.mas_bottom).offset(H_SCALE(80));
        make.size.mas_equalTo(CGSizeMake(152, 20));
        make.centerX.mas_equalTo(self.contentView);
    }];
    [self.phoneLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.crossView.mas_bottom).offset(80);
        make.leading.equalTo(self.view.mas_leading).offset(50);
        make.trailing.equalTo(self.view.mas_trailing).offset(-50);
        make.height.mas_equalTo(100);
    }];
    [self.agreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneLoginView.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(214, 20));
        make.centerX.mas_equalTo(self.contentView);
    }];
}

- (void)bindEvents {
    @weakify(self)
    [[self.closeBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        @strongify(self)
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
    }
    return _headerView;
}

- (WOOThirdLoginView *)thirdLoginView {
    if (!_thirdLoginView) {
        _thirdLoginView = [[WOOThirdLoginView alloc]init];
    }
    return _thirdLoginView;
}

- (WOOCrossView *)crossView {
    if (!_crossView) {
        _crossView = [[WOOCrossView alloc]init];
    }
    return _crossView;
}

- (WOOPhoneLoginView *)phoneLoginView {
    if (!_phoneLoginView) {
        _phoneLoginView = [[WOOPhoneLoginView alloc]init];
    }
    return _phoneLoginView;
}

- (WOOAgreeBtnView *)agreeView {
    if (!_agreeView) {
        _agreeView = [[WOOAgreeBtnView alloc]init];
    }
    return _agreeView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = UIButton.button.WH_setTitle_forState(@"关闭",UIControlStateNormal).WH_setTitleColor_forState([UIColor blackColor],UIControlStateNormal);
    }
    return _closeBtn;
}

@end

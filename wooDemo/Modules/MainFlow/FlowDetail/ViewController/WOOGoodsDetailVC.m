//
//  WOOGoodsDetailVC.m
//  wooDemo
//
//  Created by colr on 2018/11/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOGoodsDetailVC.h"
#import "WOOGoodsDetailTopView.h"
#import "WOOGoodsDetailCashBackView.h"
#import "WOOOrderStatusVC.h"

@interface WOOGoodsDetailVC ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) WOOGoodsDetailTopView * goodsView;
@property (nonatomic, strong) WOOGoodsDetailCashBackView * cashBackView;
@property (nonatomic, strong) UIView * headerView ;

@end

@implementation WOOGoodsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupConstraint];
    [self dataBing]; 
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.hidden = NO;
    self.navBar.titleLabel.text = @"商品详情";
    self.navBar.backgroundColor = [UIColor woo_colorWithHexString:@"D8D8D8"];
}

- (void)setupView {
    self.view.backgroundColor = woo_colorWithHexString(@"F2F2F2");
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.headerView];
    [self.contentView addSubview:self.goodsView];
    [self.contentView addSubview:self.cashBackView];
}

- (void)setupConstraint {
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(NAVIGATION_BAR_HEIGHT);
        make.leading.equalTo(self.view.mas_leading).offset(15);
        make.trailing.equalTo(self.view.mas_trailing).offset(-15);
        make.bottom.equalTo(self.view.mas_bottom).offset(-HOME_INDICATOR_HEIGHT);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.top.equalTo(self.headerView);
        make.bottom.equalTo(self.cashBackView.mas_bottom).offset(20);
    }];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(20);
    }];
    
    [self.goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(0);
        make.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo([self.goodsModel cellHeight]);
    }];
    [self.cashBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsView.mas_bottom).offset(15);
        make.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(290);
    }];
}

- (void)dataBing {
    [self.goodsView setModel:self.goodsModel];
    [self.cashBackView setModel:self.goodsModel];
    @weakify(self);
    [self.cashBackView.rewardSubject subscribeNext:^(WOORewardRow *row) {
        @strongify(self);
        if (row.rewardBuyUrl) {
            NSURL * url = [NSURL URLWithString:row.rewardBuyUrl];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            WOOOrderStatusVC * statusVC = [[WOOOrderStatusVC alloc]init];
            statusVC.model = row;
            [self.navigationController pushViewController:statusVC animated:YES];
        }
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

- (WOOGoodsDetailTopView *)goodsView {
    if (!_goodsView) {
        _goodsView = [[WOOGoodsDetailTopView alloc]init];
    }
    return _goodsView;
}

- (WOOGoodsDetailCashBackView *)cashBackView {
    if (!_cashBackView) {
        _cashBackView = [[WOOGoodsDetailCashBackView alloc]init];
    }
    return _cashBackView;
}

-(UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
        _headerView.backgroundColor = [UIColor clearColor];
    }
    return _headerView;
}


@end

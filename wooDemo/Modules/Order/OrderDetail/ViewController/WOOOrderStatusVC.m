//
//  WOOOrderStatusVC.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOOrderStatusVC.h"
#import "WOOGoodsView.h"

@interface WOOOrderStatusVC ()

@property (nonatomic, strong)WOOGoodsView * goodsView;

@end

@implementation WOOOrderStatusVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.titleLabel.text = @"订单状态";
    self.navBar.titleLabel.font = WOOMFont(16);
    self.navBar.titleLabel.textColor = woo_colorWithHexString(@"#222222");
    self.navBar.backgroundColor = woo_colorWithHexString(@"#F2F2F2");
}

- (void)setupViews {
    self.view.backgroundColor = woo_colorWithHexString(@"#F2F2F2");
    [self.view addSubview:self.goodsView];
    [self.goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(NAVIGATION_BAR_HEIGHT);
        make.height.mas_equalTo(160);
    }];
    
    [self.goodsView setModel:self.model];
}

- (WOOGoodsView *)goodsView {
    if (!_goodsView) {
        _goodsView = [[WOOGoodsView alloc]initWithFrame:CGRectZero];
    }
    return _goodsView;
}



@end

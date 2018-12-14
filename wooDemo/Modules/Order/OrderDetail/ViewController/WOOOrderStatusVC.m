//
//  WOOOrderStatusVC.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOOrderStatusVC.h"
#import "WOOGoodsView.h"
#import "WOORewardHisCell.h"
#import "WOORewardService.h"
#import "WOOOrderDetailVC.h"

@interface WOOOrderStatusVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)WOOBaseTableView * MainTable;

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
    [self fetchTheOrderStatusDetial];
    if (self.toCheckTheOrder) {
        [self checkTheOrder];
    }
}

- (void)setupViews {
    self.view.backgroundColor = woo_colorWithHexString(@"#F2F2F2");
    [self.view addSubview:self.MainTable];
    [self.MainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(NAVIGATION_BAR_HEIGHT);
    }];
    if (@available(iOS 11.0, *)) {
        self.MainTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)checkTheOrder {
    @weakify(self);
    [[WOOAlertTool shareInstance] showAlterViewWithTitle:@"" Message:@"是否完成支付" cancelBtn:@"NO" doneBtn:@"YES" andDoneBlock:^(UIAlertAction * _Nonnull action) {
        @strongify(self)
        [self feedbackThePayStatus];
    } andCancelBlock:^(UIAlertAction * _Nonnull action) {
    }];
    self.toCheckTheOrder = NO;
}

- (WOOBaseTableView *)MainTable {
    if (!_MainTable) {
        _MainTable = [[WOOBaseTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _MainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _MainTable.backgroundColor = [UIColor clearColor];
        //        _MainTable.tableHeaderView = self.topUserView;
        _MainTable.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.1)];
        _MainTable.dataSource = self;
        _MainTable.delegate = self;
    }
    return _MainTable;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WOORewardHisCell * cell = [tableView dequeueReusableCellWithIdentifier:[WOORewardHisCell reuseID]];
    if (!cell) {
        cell = [[WOORewardHisCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WOORewardHisCell reuseID]];
    }
    if (self.model) {
        [cell setModel:self.model];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WOOOrderDetailVC * detailVC = [[WOOOrderDetailVC alloc]init];
    detailVC.orderId = self.model.orderId;
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)feedbackThePayStatus {
    @weakify(self);
    [WOOHud showActivityView];
    [WOORewardService getTheRewardPayedWithOrderId:self.model.orderId completion:^(BOOL isSuccess, NSError * _Nonnull error) {
        if (isSuccess) {
            @strongify(self);
            [self fetchTheOrderStatusDetial];
        }else{
            [WOOHud hideActivityView];
            NSLog(@"%@",error);
        }
    }];
}

- (void)fetchTheOrderStatusDetial {
    @weakify(self);
    [WOORewardService getTheRewardDetailWithRewardId:self.model.orderId completion:^(WOORewardRow * _Nonnull row, NSError * _Nonnull error) {
        [WOOHud hideActivityView];
        if (row) {
            @strongify(self);
            self.model = row;
            [self.MainTable reloadData];
        }
    }];
}


@end

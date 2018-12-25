//
//  WOOOrderDetailVC.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOOrderDetailVC.h"
#import "WOOOrderDetailVM.h"
#import "WOORewardRow.h"
#import "WOORewardHisCell.h"
#import "WOOOrderDetailTopCell.h"
#import "WOORewardService.h"

@interface WOOOrderDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)WOOBaseTableView * MainTable;

@property (nonatomic, strong)WOOOrderDetailVM * viewModel;

@property (nonatomic, strong)WOORewardRow * rewardModel;

@property (nonatomic, assign)BOOL checkTheStatus;

@end

@implementation WOOOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self bindingData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.titleLabel.text = @"订单明细";
    self.navBar.titleLabel.font = WOOMFont(16);
    self.navBar.titleLabel.textColor = woo_colorWithHexString(@"#222222");
    self.navBar.backgroundColor = woo_colorWithHexString(@"#F2F2F2");
}

- (void)setupViews {
    self.viewModel = [[WOOOrderDetailVM alloc]initWithRewardId:self.orderId];
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

- (void)bindingData {
    @weakify(self);
    [self.viewModel.orderDetailSubject subscribeNext:^(WOORewardRow * _Nonnull row) {
        @strongify(self);
        self.rewardModel = row;
        [WOOHud hideActivityView];
        [self.MainTable reloadData];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)checkTheOrder {
    @weakify(self);
    [[WOOAlertTool shareInstance] showAlterViewWithTitle:@"" Message:@"是否完成支付" cancelBtn:@"NO" doneBtn:@"YES" andDoneBlock:^(UIAlertAction * _Nonnull action) {
        @strongify(self)
        [self feedbackThePayStatus];
    } andCancelBlock:^(UIAlertAction * _Nonnull action) {
    }];
    self.checkTheStatus = NO;
}

- (void)feedbackThePayStatus {
    @weakify(self);
    [WOOHud showActivityView];
    [WOORewardService getTheRewardPayedWithOrderId:self.orderId completion:^(BOOL isSuccess, NSError * _Nonnull error) {
        if (isSuccess) {
            @strongify(self);
            [self.viewModel fetchTheDetailModel];
        }else{
            [WOOHud hideActivityView];
            NSLog(@"%@",error);
        }
    }];
}


- (WOOBaseTableView *)MainTable {
    if (!_MainTable) {
        _MainTable = [[WOOBaseTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _MainTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _MainTable.separatorColor = woo_colorWithHexString(@"#E1E1E1");
        _MainTable.backgroundColor = [UIColor clearColor];
        //        _MainTable.tableHeaderView = self.topUserView;
        _MainTable.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.1)];
        _MainTable.dataSource = self;
        _MainTable.delegate = self;
    }
    return _MainTable;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        if (self.rewardModel) {
            if (self.rewardModel.orderStatusType == WOOOrderStatusTypeDefault) {
                return 246;
            }else{
                return 192;
            }
        }else{
            return 200;
        }
    }else{
        return 160;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        WOOOrderDetailTopCell * cell = [tableView dequeueReusableCellWithIdentifier:[WOOOrderDetailTopCell reuseID]];
        if (!cell) {
            cell = [[WOOOrderDetailTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WOOOrderDetailTopCell reuseID]];
        }
        if (self.rewardModel) {
            @weakify(self)
            [cell.paySubject subscribeNext:^(id  _Nonnull x) {
                @strongify(self)
                NSURL * url = [NSURL URLWithString:self.rewardModel.rewardBuyUrl];
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                [self checkTheOrder];
            }];
            [cell setOrderType:self.rewardModel.orderStatusType];
        }
        return cell;
    }else{
        WOORewardHisCell * cell = [tableView dequeueReusableCellWithIdentifier:[WOORewardHisCell reuseID]];
        if (!cell) {
            cell = [[WOORewardHisCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WOORewardHisCell reuseID]];
        }
        if (self.rewardModel) {
            [cell setModel:self.rewardModel];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        
    }
}


@end

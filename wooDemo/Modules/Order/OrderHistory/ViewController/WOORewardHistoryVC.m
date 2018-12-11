//
//  WOORewardHistoryVC.m
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOORewardHistoryVC.h"
#import "WOORewardHostoryVM.h"
#import "WOORewardHisCell.h"
#import "WOORewardHisTopView.h"

@interface WOORewardHistoryVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)WOOBaseTableView * MainTable;

@property (nonatomic, strong)WOORewardHostoryVM * viewModel;

@end

@implementation WOORewardHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self dataBinding];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.titleLabel.text = @"注意力订单";
    self.navBar.titleLabel.font = WOOMFont(16);
    self.navBar.titleLabel.textColor = woo_colorWithHexString(@"#222222");
    self.navBar.backgroundColor = woo_colorWithHexString(@"#F2F2F2");
}

- (void)setupViews {
    self.viewModel = [[WOORewardHostoryVM alloc]init];
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

- (void)dataBinding {
    @weakify(self)
    [[[RACObserve(self, viewModel.dataList) skip:1] deliverOnMainThread] subscribeNext:^(NSArray *dataArr) {
        @strongify(self);
        [self.MainTable reloadData];
    }];
}

- (WOOBaseTableView *)MainTable {
    if (!_MainTable) {
        _MainTable = [[WOOBaseTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _MainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _MainTable.backgroundColor = [UIColor clearColor];
//        _MainTable.tableHeaderView = self.topUserView;
        _MainTable.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 10)];
        _MainTable.dataSource = self;
        _MainTable.delegate = self;
    }
    return _MainTable;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 174;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WOORewardHisCell * cell = [tableView dequeueReusableCellWithIdentifier:[WOORewardHisCell reuseID]];
    if (!cell) {
        cell = [[WOORewardHisCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WOORewardHisCell reuseID]];
    }
    WOORewardRow * row = self.viewModel.dataList[indexPath.row];
    if (row) {
        [cell setModel:row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        WOORewardHistoryVC * hisVC = [[WOORewardHistoryVC alloc]init];
        [self.navigationController pushViewController:hisVC animated:YES];
    }
}




@end

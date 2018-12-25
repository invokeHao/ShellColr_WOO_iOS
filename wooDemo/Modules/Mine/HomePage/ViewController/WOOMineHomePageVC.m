//
//  WOOMineHomePageVC.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMineHomePageVC.h"
#import "WOOMineHomePageVM.h"
#import "WOOLoginViewController.h"
#import "WOOMinePageCell.h"
#import "WOOMineTopUserView.h"
#import "WOORewardHistoryVC.h"
#import "WOOMyFavoriteVC.h"

@interface WOOMineHomePageVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)WOOBaseTableView * MainTable;

@property (nonatomic, strong)WOOMineHomePageVM * viewModel;

@property (nonatomic, strong)WOOMineTopUserView * topUserView;

@end

@implementation WOOMineHomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self bindingData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.titleLabel.text = @"我的";
    self.navBar.titleLabel.font = WOOMFont(16);
    self.navBar.titleLabel.textColor = woo_colorWithHexString(@"#222222");
    self.navBar.backgroundColor = woo_colorWithHexString(@"#F2F2F2");
    self.navBar.leftButton.hidden = YES;
    [self.viewModel refreshTheUserInfo];
    [self.topUserView setModel:self.viewModel.userModel.profile];
}

- (void)setupUI {
    self.viewModel = [[WOOMineHomePageVM alloc]init];
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
    [[[RACObserve(self, viewModel.dataList) skip:1] deliverOnMainThread] subscribeNext:^(NSArray *dataArr) {
        @strongify(self);
        [self.MainTable reloadData];
    }];
    
//    [[[RACObserve(self, viewModel.userModel) skip:1] deliverOnMainThread] subscribeNext:^(WOOLoginModel * loginModel) {
//        @strongify(self);
//
//    }];
}

- (void)goToLogin{
    WOOLoginViewController * loginVC = [[WOOLoginViewController alloc]init];
    [self.navigationController presentViewController:loginVC animated:YES completion:NULL
     ];
}

- (WOOBaseTableView *)MainTable {
    if (!_MainTable) {
        _MainTable = [[WOOBaseTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _MainTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _MainTable.separatorColor = woo_colorWithHexString(@"#F2F2F2");
        _MainTable.separatorInset = UIEdgeInsetsMake(0, 90, 0, 32);
        _MainTable.backgroundColor = [UIColor clearColor];
        _MainTable.tableHeaderView = self.topUserView;
        _MainTable.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 10)];
        _MainTable.dataSource = self;
        _MainTable.delegate = self;
    }
    return _MainTable;
}

- (WOOMineTopUserView *)topUserView {
    if (!_topUserView) {
        _topUserView = [[WOOMineTopUserView alloc]initWithFrame:CGRectMake(0, 0, VERTICAL_SCREEN_WIDTH, 124)];
        @weakify(self)
        [_topUserView.loginSubject subscribeNext:^(NSString * sendStr) {
            @strongify(self)
            if ([sendStr isEqualToString:@"WOOLogin"]) {
                [self goToLogin];
            }
        }];
    }
    return _topUserView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 3;
    }else if (section == 1){
        return 2;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 63;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WOOMinePageCell * cell = [tableView dequeueReusableCellWithIdentifier:[WOOMinePageCell reuseID]];
    if (!cell) {
        cell = [[WOOMinePageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WOOMinePageCell reuseID]];
    }
    WOOMineBasicModel * model = nil;
    if (indexPath.section == 0) {
        model = self.viewModel.dataList[indexPath.row];
    }else if (indexPath.section == 1) {
        model = self.viewModel.dataList[indexPath.row + 3];
    }else {
        model = [self.viewModel.dataList lastObject];
    }
    if (model) {
        [cell setModel:model];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        WOORewardHistoryVC * hisVC = [[WOORewardHistoryVC alloc]init];
        [self.navigationController pushViewController:hisVC animated:YES];
    }
    else if (indexPath.section == 0 && indexPath.row == 1) {
        WOOMyFavoriteVC * favoriteVC = [[WOOMyFavoriteVC alloc]init];
        [self.navigationController pushViewController:favoriteVC animated:YES];
    }
}




@end

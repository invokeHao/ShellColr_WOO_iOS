//
//  WOOLoginViewController.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOLoginViewController.h"

@interface WOOLoginViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView * MainTable;

@property (strong, nonatomic)NSMutableArray * dataArray;

@end

@implementation WOOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UITableView *)MainTable {
    if (!_MainTable) {
        _MainTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _MainTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _MainTable.separatorColor = woo_colorWithHexString(@"2B2B2B");
        _MainTable.delegate = self;
        _MainTable.dataSource = self;
    }
    return _MainTable;
}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


@end

//
//  WOOMineHomePageVM.m
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMineHomePageVM.h"

@interface WOOMineHomePageVM ()

@property (strong, nonatomic)NSArray<WOOMineBasicModel *> * dataList;

@property (strong, nonatomic)WOOLoginModel * userModel;

@end

@implementation WOOMineHomePageVM

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configTheBasicData];
        [self refreshTheUserInfo];
    }
    return self;
}

- (void)configTheBasicData {
    NSMutableArray * dataArr = [NSMutableArray array];
    NSArray * imageStrArr = @[@"order",@"shoppingBag",@"cash_icon",@"favourite_icon",@"history",@"gears"];
    NSArray * titleArr = @[@"注意力订单",@"购物袋",@"现金",@"我的收藏",@"阅读历史",@"设置"];
    for (int i = 0; i < 6; i++) {
        WOOMineBasicModel * model = [[WOOMineBasicModel alloc]init];
        model.iconName = imageStrArr[i];
        model.titleName = titleArr[i];
        [dataArr addObject:model];
    }
    self.dataList = [dataArr copy];
}

- (void)refreshTheUserInfo {
    self.userModel = [WOOLoginManager sharedManager].userLoginModel;
}


@end

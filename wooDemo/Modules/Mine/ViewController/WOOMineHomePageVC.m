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

@interface WOOMineHomePageVC ()

@property (nonatomic, strong)WOOBaseTableView * MainTable;

@property (nonatomic, strong)WOOMineHomePageVM * viewModel;

@end

@implementation WOOMineHomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * loginBtn = UIButton.button.WH_setTitle_forState(@"登录",UIControlStateNormal).WH_setTitleColor_forState([UIColor blackColor],UIControlStateNormal);
    [loginBtn setFrame:CGRectMake(100, 100, 44, 44)];
    [loginBtn addTarget:self action:@selector(goToLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)goToLogin{
    WOOLoginViewController * loginVC = [[WOOLoginViewController alloc]init];
    [self.navigationController presentViewController:loginVC animated:YES completion:NULL
     ];
}


@end

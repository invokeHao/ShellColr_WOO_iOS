//
//  WOOBaseViewController.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseViewController.h"

@interface WOOBaseViewController ()

@end

@implementation WOOBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navBar];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self _bindEvents];
}

- (void)_bindEvents {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"ico_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navBar.leftButton = backButton;
}

#pragma mark - Actions

- (void)backButtonAction:(UIButton *)button {
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count > 1) {
            [self.navigationController popViewControllerAnimated:YES];
        } else if (self.navigationController.presentationController) {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
    } else {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

#pragma mark - Accessors

- (WOONavigationbar *)navBar {
    if (!_navBar) {
        _navBar = [[WOONavigationbar alloc] init];
    }
    return _navBar;
}

#pragma mark - Override

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view bringSubviewToFront:self.navBar];
}

@end

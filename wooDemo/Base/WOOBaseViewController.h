//
//  WOOBaseViewController.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WOONavigationbar.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOBaseViewController : UIViewController

@property (nonatomic, strong) WOONavigationbar *navBar;

- (void)backButtonAction:(UIButton *)button;

@end

NS_ASSUME_NONNULL_END

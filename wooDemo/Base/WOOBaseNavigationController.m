//
//  WOOBaseNavigationController.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseNavigationController.h"

@interface WOOBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation WOOBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBarHidden = YES;
    
    __weak WOOBaseNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                                       style:UIBarButtonItemStylePlain
                                                                                      target:nil
                                                                                      action:nil];
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 使自定义了 nav bar 返回按钮的 view controller 也可以通过 interactivePopGestureRecognizer 来 pop
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count < 2 ||
            self.visibleViewController == (self.viewControllers)[0]) {
            return NO;
        }
//        if ([self.visibleViewController isKindOfClass:[CMSVideoPlayDetailVC class]]) {
//            return NO;`
//        }
    }
    return YES;
}


@end

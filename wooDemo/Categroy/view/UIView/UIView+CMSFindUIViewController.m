//
//  UIView+CMSFindUIViewController.m
//  cosmos
//
//  Created by Lane on 2018/7/30.
//  Copyright © 2018 Shell&Colr. All rights reserved.
//

#import "UIView+CMSFindUIViewController.h"

@implementation UIView (CMSFindUIViewController)

- (UIViewController *)firstAvailableUIViewController {
    // convenience function for casting and to "mask" the recursive function
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id)traverseResponderChainForUIViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}

@end

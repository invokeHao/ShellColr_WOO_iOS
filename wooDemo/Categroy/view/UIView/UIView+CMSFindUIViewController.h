//
//  UIView+CMSFindUIViewController.h
//  cosmos
//
//  Created by Lane on 2018/7/30.
//  Copyright © 2018 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CMSFindUIViewController)

- (UIViewController *)firstAvailableUIViewController;
- (id)traverseResponderChainForUIViewController;

@end

NS_ASSUME_NONNULL_END

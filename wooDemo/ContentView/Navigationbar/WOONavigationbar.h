//
//  WOONavigationbar.h
//  cosmos
//
//  Created by Lane on 2018/6/20.
//  Copyright © 2018 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOONavigationbar : UIView

@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

NS_ASSUME_NONNULL_END

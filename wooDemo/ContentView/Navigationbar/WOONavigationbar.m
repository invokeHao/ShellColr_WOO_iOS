//
//  WOONavigationbar.m
//  cosmos
//
//  Created by Lane on 2018/6/20.
//  Copyright © 2018 Shell&Colr. All rights reserved.
//

#import "WOONavigationbar.h"

const CGFloat navButtonWidth = 60.0f;

@interface WOONavigationbar ()

@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation WOONavigationbar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, VERTICAL_SCREEN_WIDTH, NAVIGATION_BAR_HEIGHT)];
}

- (void)setupViews {
    [self addSubview:self.navigationView];
    [self.navigationView addSubview:self.titleLabel];
}

#pragma mark - Accessors

- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, VERTICAL_SCREEN_WIDTH, 44)];
    }
    return _navigationView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(navButtonWidth, 0, self.bounds.size.width - 2 * navButtonWidth, 44)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        [_titleLabel setFont:[UIFont systemFontOfSize:16]];
    }
    return _titleLabel;
}

#pragma mark - Getter & Setter

- (void)setLeftButton:(UIButton *)leftButton {
    if (_leftButton) {
        [_leftButton removeFromSuperview];
        _leftButton = nil;
    }
    _leftButton = leftButton;
    _leftButton.frame = CGRectMake(0, 0, navButtonWidth, 44);
    [self.navigationView addSubview:_leftButton];
}

- (void)setRightButton:(UIButton *)rightButton {
    if (_rightButton) {
        [_rightButton removeFromSuperview];
        _rightButton = nil;
    }
    _rightButton = rightButton;
    _rightButton.frame = CGRectMake(self.bounds.size.width - navButtonWidth, 0, navButtonWidth, 44);
    [self.navigationView addSubview:_rightButton];
}

@end

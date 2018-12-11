//
//  WOOCrossView.m
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOCrossView.h"

@interface WOOCrossView()

@property (nonatomic, strong)UIView * leftView;

@property (nonatomic, strong)UILabel * centerLabel;

@property (nonatomic, strong)UIView * rightView;

@end

@implementation WOOCrossView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.leftView];
    [self addSubview:self.centerLabel];
    [self addSubview:self.rightView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(56, 1));
    }];
    
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(24, 14));
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(56, 1));
    }];
    
    NSArray * colorArr = @[woo_colorWithHexAndAlpha(@"000000", 0.0),woo_colorWithHexAndAlpha(@"000000", 1.0)];
    NSArray * colorArr1 = @[woo_colorWithHexAndAlpha(@"000000", 1.0),woo_colorWithHexAndAlpha(@"000000", 0.0)];

    [_leftView setGradientBackgroundWithColors:colorArr locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    [_rightView setGradientBackgroundWithColors:colorArr1 locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];

}

- (UIView *)leftView {
    if (!_leftView) {
        _leftView = [[UIView alloc]init];
    }
    return _leftView;
}

- (UIView *)rightView {
    if (!_rightView) {
        _rightView = [[UIView alloc]init];
    }
    return _rightView;
}

- (UILabel *)centerLabel {
    if (!_centerLabel) {
        _centerLabel = UILabel.label.WH_font(WOOFont(10)).WH_textColor(woo_colorWithHexString(@"#333333")).WH_text(@"或者").WH_textAlignment(NSTextAlignmentCenter);
    }
    return _centerLabel;
}


@end

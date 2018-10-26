//
//  UIView+Extension.h
//
//  Created by dapiao on 15/8/13.
//  Copyright (c) 2015年 dapiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;

// edges related
@property (nonatomic, assign) CGFloat cms_top;
@property (nonatomic, assign) CGFloat cms_bottom;
@property (nonatomic, assign) CGFloat cms_left;
@property (nonatomic, assign) CGFloat cms_right;
@end

//
//  UIScrollView+AllowPanGestureEventPass.m
//  cosmos
//
//  Created by colr on 2018/6/21.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UIScrollView+AllowPanGestureEventPass.h"

@implementation UIScrollView (AllowPanGestureEventPass)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] ) {
        NSLog(@"走到这里了");
        return YES;
    }
    return NO;
}

@end

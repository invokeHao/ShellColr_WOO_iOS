//
//  UIView+WLAddition.m
//  cosmos
//
//  Created by Lane on 2018/4/23.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UIView+WLAddition.h"

@implementation UIView (WLAddition)

- (void)addSubviewArray:(NSArray *)viewArray {
    if (viewArray.count > 0) {
        [viewArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIView class]]) {
                [self addSubview:obj];
            }
        }];
    }
}

@end

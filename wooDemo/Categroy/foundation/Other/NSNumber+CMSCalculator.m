//
//  NSNumber+CMSCalculator.m
//  cosmos
//
//  Created by Lane on 2018/4/24.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSNumber+CMSCalculator.h"

#define SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH  MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)

static CGFloat ReferHeight = 736.f;
static CGFloat ReferWidth = 414.f;

@implementation NSNumber (CMSCalculator)

- (CGFloat)floatToWidth {
    return [self floatValue] * SCREEN_WIDTH / ReferWidth;
}

- (CGFloat)floatToHeight {
    return [self floatValue] * SCREEN_HEIGHT / ReferHeight;
}

- (CGFloat)percentToWidth {
    return [self floatValue] / SCREEN_WIDTH;
}

- (CGFloat)percentToHeight {
    return [self floatValue] / SCREEN_HEIGHT;
}

@end

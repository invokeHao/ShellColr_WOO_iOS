//
//  WOOInsJiuSubSectionController.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuSubSectionController.h"

@implementation WOOInsJiuSubSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = (VERTICAL_SCREEN_WIDTH -8)/3;
    return CGSizeMake(width, width);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOInsJiuCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuCell class] forSectionController:self atIndex:index];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[WOOJiuListDemoModel class]]) {
        self.listModel = object;
    }
}

@end

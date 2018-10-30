//
//  WOOInsJiuBottomSectionController.m
//  wooDemo
//
//  Created by colr on 2018/10/30.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuBottomSectionController.h"
#import "WOOJiuListDemoModel.h"
#import "WOOInsJiuCell.h"

@interface WOOInsJiuBottomSectionController()

@property (nonatomic, strong)WOOJiuListDemoModel * listModel;

@end

@implementation WOOInsJiuBottomSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(3, 3, 3, 3);
        self.minimumInteritemSpacing = 2;
        self.minimumLineSpacing = 3;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.listModel.bottomArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat itemSize = floorf((width - 12)/3);
    return CGSizeMake(itemSize , itemSize);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOInsJiuCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuCell class] forSectionController:self atIndex:index];
    WOOJIuDemoModel * model = self.listModel.bottomArray[index];
    [cell setModel:model];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[WOOJiuListDemoModel class]]) {
        self.listModel = object;
    }
}

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

@end

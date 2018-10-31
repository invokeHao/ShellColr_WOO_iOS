//
//  WOOInsJiuSectionController.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuSectionController.h"
#import "WOOInsJiuSubSectionController.h"
#import "WOOJiuListDemoModel.h"
#import "WOOInsJiuLayoutCell.h"

@interface WOOInsJiuSectionController ()<IGListAdapterDataSource>

@property (nonatomic, strong) WOOJiuListDemoModel * listModel;

@property (nonatomic, strong) IGListAdapter *adapter;

@end

@implementation WOOInsJiuSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(3, 3, 3, 3);
        self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self.viewController];
        [self.adapter setDataSource:self];

    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat itemSize = floorf((width - 10)/3);
    return CGSizeMake(width - 6 , itemSize*2 + 4);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOInsJiuLayoutCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuLayoutCell class] forSectionController:self atIndex:index];
    self.adapter.collectionView = cell.collectionView;
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

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    return [[WOOInsJiuSubSectionController alloc]init];
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:0];
    [arr addObject:self.listModel];
    return [arr copy];
}

@end

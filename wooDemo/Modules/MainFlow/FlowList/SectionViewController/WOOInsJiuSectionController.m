//
//  WOOInsJiuSectionController.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuSectionController.h"
#import "WOOJiuListDemoModel.h"
#import "WOOInsJiuLayoutCell.h"
#import "WOOInsJiuSubSectionController.h"

@interface WOOInsJiuSectionController ()<IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;

@property (nonatomic, strong) WOOJiuListDemoModel * listModel;

@end

@implementation WOOInsJiuSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 3, 3, 3);
        self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self.viewController];
        self.adapter.dataSource = self;
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = (VERTICAL_SCREEN_WIDTH -8)/3;
    return CGSizeMake(VERTICAL_SCREEN_WIDTH -6, width * 4 + 12);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOInsJiuLayoutCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuLayoutCell class] forSectionController:self atIndex:index];
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
    return [[WOOInsJiuSectionController alloc]init];
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.listModel.dataArray;
}

@end

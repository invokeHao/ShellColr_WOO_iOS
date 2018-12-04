//
//  WOOMineHomePageVC.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMineHomePageVC.h"
#import "WOOMineSectionController.h"

@interface WOOMineHomePageVC ()<IGListAdapterDataSource>

@property (nonatomic, strong)ASCollectionNode * collectionNode;

@property (nonatomic, strong)IGListAdapter * apdapter;

@end

@implementation WOOMineHomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    IGListAdapterUpdater * updater = [[IGListAdapterUpdater alloc]init];
    self.apdapter = [[IGListAdapter alloc]initWithUpdater:updater viewController:self workingRangeSize:0];
    self.apdapter.dataSource = self;
    [self.apdapter setASDKCollectionNode:self.collectionNode];
}

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    return [[WOOMineSectionController alloc]init];
}

- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (ASCollectionNode *)collectionNode {
    if (!_collectionNode) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:layout];
        [_collectionNode setBackgroundColor:woo_colorWithHexString(@"F2F2F2")];
    }
    return _collectionNode;
}


@end

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
#import "WOOFlowDetailVC.h"
#import "WOOFlowDetailVideoVC.h"

@interface WOOInsJiuBottomSectionController()

@property (nonatomic, strong)WOOJiuListDemoModel * listModel;

@end

@implementation WOOInsJiuBottomSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 20;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.listModel.bottomArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat itemSize = floorf((width - 88)/3);
    return CGSizeMake(itemSize , itemSize);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOInsJiuCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuCell class] forSectionController:self atIndex:index];
    WOOArticleModel * model = self.listModel.bottomArray[index];
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

- (void)didSelectItemAtIndex:(NSInteger)index {
    WOOArticleModel * model = self.listModel.bottomArray[index];
    if (model.video_id && model.has_video) {
        WOOFlowDetailVideoVC * videoDetailVC = [[WOOFlowDetailVideoVC alloc]init];
        videoDetailVC.video_id = model.video_id;
        videoDetailVC.itemId = model.group_id;
        videoDetailVC.titleStr = model.abstract;
        [self.viewController.navigationController pushViewController:videoDetailVC animated:YES];
    }else{
        WOOFlowDetailVC * detailVC = [[WOOFlowDetailVC alloc]init];
        detailVC.itemId = model.group_id;
        detailVC.videoId = model.video_id;
        [self.viewController.navigationController pushViewController:detailVC animated:YES];
    }
}

//- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController {
//    NSLog(@"Will display section %ld", sectionController.section);
//}
//
//- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController cell:(UICollectionViewCell *)cell atIndex:(NSInteger)index {
//    NSLog(@"Did will display cell %ld in section %ld", index, sectionController.section);
//}
//
//- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController {
//    NSLog(@"Did end display section %ld", sectionController.section);
//}
//
//- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController cell:(UICollectionViewCell *)cell atIndex:(NSInteger)index {
//    NSLog(@"Did end displaying cell %ld in section %ld", index, sectionController.section);
//}

@end

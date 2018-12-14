//
//  WOONewBottomListSC.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewBottomListSC.h"
#import "WOOBottomImagListCell.h"
#import "WOOBottomTextOnlyCell.h"
#import "WOONewListModel.h"
#import "WOOFlowDetailVC.h"
#import "WOOFlowDetailVideoVC.h"
#import "WOOGoodsDetailVC.h"
#import "WOONewFlowListVC.h"


@interface WOONewBottomListSC()<IGListDisplayDelegate>

@property (nonatomic, strong)WOONewListModel * listModel;

@end

@implementation WOONewBottomListSC

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumLineSpacing = 15;
        self.displayDelegate = self;
    }
    return self;
}

- (NSInteger)numberOfItems{
    return self.listModel.TopArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat KTopCellH = 167 * VERTICAL_SCREEN_WIDTH / 375;
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = KTopCellH;
    width = width - 30;
    if (!self.listModel) {
        return CGSizeMake(width, height);
    }else{
        WOOArticleModel * model = self.listModel.BottomArray[index];
        if (model.modelType == WOOArticleModelBottomTextOnlyType) {
            return CGSizeMake(width, [model bottomTextOnlySCHeight]);
        }else{
            return CGSizeMake(width, [model bottomImageListSCHeight]);
        }
    }
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOArticleModel * model = self.listModel.BottomArray[index];
    if (model.modelType == WOOArticleModelBottomTextOnlyType) {
        WOOBottomTextOnlyCell * cell = [self.collectionContext dequeueReusableCellOfClass:[WOOBottomTextOnlyCell class] forSectionController:self atIndex:index];
        [cell setModel:model];
        return cell;
    }else{
        WOOBottomImagListCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOBottomImagListCell class] forSectionController:self atIndex:index];
        [cell setModel:model];
        return cell;
    }
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[WOONewListModel class]]) {
        self.listModel = object;
    }
}

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    WOOArticleModel * model = self.listModel.BottomArray[index];
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

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController {
}

- (void)listAdapter:(nonnull IGListAdapter *)listAdapter didEndDisplayingSectionController:(nonnull IGListSectionController *)sectionController {
//    NSLog(@"didEndDisplayingSectionController");
}


- (void)listAdapter:(nonnull IGListAdapter *)listAdapter didEndDisplayingSectionController:(nonnull IGListSectionController *)sectionController cell:(nonnull UICollectionViewCell *)cell atIndex:(NSInteger)index {
//    NSLog(@"didEndDisplayingSectionController");
}


- (void)listAdapter:(nonnull IGListAdapter *)listAdapter willDisplaySectionController:(nonnull IGListSectionController *)sectionController cell:(nonnull UICollectionViewCell *)cell atIndex:(NSInteger)index {
    if ([self.viewController isKindOfClass:[WOONewFlowListVC class]] && index == 0) {
        WOONewFlowListVC *flowVC = (WOONewFlowListVC *)self.viewController;
        [flowVC getMoreDataWithDisPlayModel:self.listModel];
    }
}
@end

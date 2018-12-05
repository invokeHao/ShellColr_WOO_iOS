//
//  WOOHotVideoVC.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOHotVideoSC.h"
#import "WOOHotVideoCell.h"
#import "WOONewListModel.h"
#import "WOOFlowDetailVC.h"
#import "WOOFlowDetailVideoVC.h"
#import "WOOGoodsDetailVC.h"

@interface WOOHotVideoSC()

@property (nonatomic, strong)WOONewListModel * listModel;

@end

@implementation WOOHotVideoSC

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat KTopCellH = 345 * VERTICAL_SCREEN_WIDTH / 375;
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = KTopCellH;
    width = width - 30;
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOHotVideoCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOHotVideoCell class] forSectionController:self atIndex:index];
    WOOArticleModel * model = self.listModel.HotVideoModel;
    [cell setModel:model];
    return cell;
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
    WOOArticleModel * model = self.listModel.HotVideoModel;
    WOOFlowDetailVideoVC * videoDetailVC = [[WOOFlowDetailVideoVC alloc]init];
    videoDetailVC.video_id = model.video_id;
    videoDetailVC.itemId = model.group_id;
    videoDetailVC.titleStr = model.abstract;
    [self.viewController.navigationController pushViewController:videoDetailVC animated:YES];
}

@end

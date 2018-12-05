//
//  WOONewListSectionController.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewListTopSC.h"
#import "WOONewListTopCell.h"
#import "WOONewListModel.h"
#import "WOOFlowDetailVC.h"
#import "WOOFlowDetailVideoVC.h"
#import "WOOGoodsDetailVC.h"


@interface WOONewListTopSC()

@property (nonatomic, strong)WOONewListModel * listModel;

@end

@implementation WOONewListTopSC
- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 15;
    }
    return self;
}

- (NSInteger)numberOfItems{
    return self.listModel.TopArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
     CGFloat KTopCellH = 228 * VERTICAL_SCREEN_WIDTH / 375;
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = KTopCellH;
    width = (width - 45)/2;
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOONewListTopCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOONewListTopCell class] forSectionController:self atIndex:index];
    WOOArticleModel * model = self.listModel.TopArray[index];
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
    WOOArticleModel * model = self.listModel.TopArray[index];
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

@end

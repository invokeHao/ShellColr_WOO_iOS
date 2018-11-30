//
//  WOOInsInformationBottomSectionController.m
//  wooDemo
//
//  Created by colr on 2018/11/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsInformationBottomSectionController.h"
#import "WOOJiuListDemoModel.h"
#import "WOOInsJiuInfoCell.h"
#import "WOOFlowDetailVC.h"
#import "WOOFlowDetailVideoVC.h"

@interface WOOInsInformationBottomSectionController ()

@property (nonatomic, strong)WOOJiuListDemoModel * listModel;

@end

@implementation WOOInsInformationBottomSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 20, 0, 20);
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width - 48 , 104);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOInsJiuInfoCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuInfoCell class] forSectionController:self atIndex:index];
    WOOArticleModel * model = self.listModel.lastModel;
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
    WOOArticleModel * model = self.listModel.lastModel;
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

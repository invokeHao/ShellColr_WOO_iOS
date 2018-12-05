//
//  WOOGoodsListSC.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOGoodsListSC.h"
#import "WOONewGoodsCell.h"
#import "WOONewListModel.h"
#import "WOOFlowDetailVC.h"
#import "WOOFlowDetailVideoVC.h"
#import "WOOGoodsDetailVC.h"

@interface WOOGoodsListSC()

@property (nonatomic, strong)WOONewListModel * listModel;

@end

@implementation WOOGoodsListSC

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 15;
    }
    return self;
}

- (NSInteger)numberOfItems{
    return self.listModel.GoodsArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat KTopCellH = 228 * VERTICAL_SCREEN_WIDTH / 375;
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat height = KTopCellH;
    width = (width - 45)/2;
    return CGSizeMake(width, height);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
     WOONewGoodsCell*cell = [self.collectionContext dequeueReusableCellOfClass:[WOONewGoodsCell class] forSectionController:self atIndex:index];
    WOOGoodsModel * model = self.listModel.GoodsArray[index];
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
    id Unknowmodel = self.listModel.GoodsArray[index];
    if ([Unknowmodel isKindOfClass:[WOOGoodsModel class]]) {
        WOOGoodsModel * goodsModel = Unknowmodel;
        WOOGoodsDetailVC * detaiVC = [[WOOGoodsDetailVC alloc]init];
        detaiVC.goodsModel = goodsModel;
        [self.viewController.navigationController pushViewController:detaiVC animated:YES];
    }
}

@end

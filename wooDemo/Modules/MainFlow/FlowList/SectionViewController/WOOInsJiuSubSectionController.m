//
//  WOOInsJiuSubSectionController.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuSubSectionController.h"
#import "WOOInsJiuCell.h"
#import "WOOGoodsCell.h"
#import "WOOArticleModel.h"
#import "WOOJiuListDemoModel.h"
#import "WOOFlowDetailVC.h"
#import "WOOFlowDetailVideoVC.h"
#import "WOOGoodsDetailVC.h"

@interface WOOInsJiuSubSectionController ()

@property (nonatomic ,strong)WOOJiuListDemoModel * listModel;

@end

@implementation WOOInsJiuSubSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 0, 4, 0);
        self.minimumInteritemSpacing = 20;
        self.minimumLineSpacing = 20;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.listModel.dataArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat itemSize = floorf((width - 40)/3);
    int bigIndex = self.listModel.isRight ? 2 : 0;
    
    if (index == bigIndex) {
        WOOArticleModel * model = self.listModel.dataArray[index];
        model.isBigCell = YES;
        return CGSizeMake(itemSize * 2 + 20, itemSize * 2 + 20);
    }
    return CGSizeMake(itemSize, itemSize);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    id  model = self.listModel.dataArray[index];
    if ([model isKindOfClass:[WOOArticleModel class]]) {
        WOOArticleModel * articleModel = model;
        WOOInsJiuCell *jiucell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuCell class] forSectionController:self atIndex:index];
        [jiucell setModel:articleModel];
        return jiucell;
    }else{
        WOOGoodsModel * goodsModel = model;
        WOOGoodsCell * goodsCell = [self.collectionContext dequeueReusableCellOfClass:[WOOGoodsCell class] forSectionController:self atIndex:index];
        [goodsCell setModel:goodsModel];
        return goodsCell;
    }
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[WOOJiuListDemoModel class]]) {
        self.listModel = object;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    id Unknowmodel = self.listModel.dataArray[index];
    if ([Unknowmodel isKindOfClass:[WOOArticleModel class]]) {
        WOOArticleModel * model = Unknowmodel;
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

    }else if ([Unknowmodel isKindOfClass:[WOOGoodsModel class]]) {
        WOOGoodsModel * goodsModel = Unknowmodel;
        WOOGoodsDetailVC * detaiVC = [[WOOGoodsDetailVC alloc]init];
        detaiVC.goodsModel = goodsModel;
        [self.viewController.navigationController pushViewController:detaiVC animated:YES];
    }
}

@end

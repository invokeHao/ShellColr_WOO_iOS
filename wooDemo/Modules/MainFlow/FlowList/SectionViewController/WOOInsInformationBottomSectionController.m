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

@interface WOOInsInformationBottomSectionController ()

@property (nonatomic, strong)WOOJiuListDemoModel * listModel;

@end

@implementation WOOInsInformationBottomSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(3, 3, 3, 3);
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    return CGSizeMake(width - 6 , 108);
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
    [WOOHud showString:model.title];
}
@end

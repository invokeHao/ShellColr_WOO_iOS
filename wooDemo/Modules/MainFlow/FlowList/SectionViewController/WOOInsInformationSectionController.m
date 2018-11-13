//
//  WOOInsInformationSectionController.m
//  wooDemo
//
//  Created by colr on 2018/10/30.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsInformationSectionController.h"
#import "WOOJiuListDemoModel.h"
#import "WOOInsJiuInfoCell.h"

@interface WOOInsInformationSectionController ()

@property (nonatomic, strong)WOOJiuListDemoModel * listModel;

@end

@implementation WOOInsInformationSectionController

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
    WOOArticleModel * model = self.listModel.firstModel;
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
    WOOArticleModel * model = self.listModel.firstModel;
    [WOOHud showString:model.title];
}

@end

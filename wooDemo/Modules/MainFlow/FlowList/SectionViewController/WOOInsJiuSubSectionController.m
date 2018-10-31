//
//  WOOInsJiuSubSectionController.m
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsJiuSubSectionController.h"
#import "WOOInsJiuCell.h"
#import "WOOJIuDemoModel.h"
#import "WOOJiuListDemoModel.h"

@interface WOOInsJiuSubSectionController ()

@property (nonatomic ,strong)WOOJiuListDemoModel * listModel;

@end

@implementation WOOInsJiuSubSectionController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 2;
        self.minimumLineSpacing = 3;
    }
    return self;
}


- (NSInteger)numberOfItems {
    return self.listModel.dataArray.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionContext.containerSize.width;
    CGFloat itemSize = floorf((width - 6)/3);
    if (index == 2) {
        return CGSizeMake(itemSize * 2 + 3, itemSize * 2 + 3);
    }
    return CGSizeMake(itemSize, itemSize);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOOInsJiuCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuCell class] forSectionController:self atIndex:index];
    WOOJIuDemoModel * model = self.listModel.dataArray[index];
    [cell setModel:model];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[WOOJiuListDemoModel class]]) {
        self.listModel = object;
    }
}

-(void)didSelectItemAtIndex:(NSInteger)index {
    WOOJIuDemoModel * model = self.listModel.dataArray[index];
    [WOOHud showString:model.title];
}

@end

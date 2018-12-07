//
//  WOONewHeaderSC.m
//  wooDemo
//
//  Created by colr on 2018/12/6.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewHeaderSC.h"
#import "WOONewHeaderCell.h"
#import "WOONewListModel.h"

@interface WOONewHeaderSC()

@property (nonatomic, strong)WOONewListModel * listModel;

@end

@implementation WOONewHeaderSC

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    CGFloat KTopCellH = 46 * VERTICAL_SCREEN_WIDTH / 375;
    CGFloat width = self.collectionContext.containerSize.width - 30;
    CGFloat height = KTopCellH;
    if (self.listModel.isTop) {
        if (self.listModel.showTheDate) {
            CGFloat KTopH = 66 * VERTICAL_SCREEN_WIDTH / 375;
            return CGSizeMake(width , KTopH);
        }else{
            return CGSizeMake(width, height);
        }
    }else{
        return CGSizeZero;
    }
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    WOONewHeaderCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOONewHeaderCell class] forSectionController:self atIndex:index];
    if (self.listModel.showTheDate) {
        [cell showTheDate];
    }else{
        [cell hidenTheDate];
    }
    cell.findLabel.hidden = !self.listModel.isTop;
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


@end

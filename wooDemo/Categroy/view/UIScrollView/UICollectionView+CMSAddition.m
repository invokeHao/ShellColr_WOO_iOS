//
//  UICollectionView+CMSAddition.m
//  cosmos
//
//  Created by Lane on 2018/4/30.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UICollectionView+CMSAddition.h"

@implementation UICollectionView (CMSAddition)

- (void)reloadDataWithBatchUpdates:(void (^)(void))updates completion:(void (^)(BOOL))completion {
    [self reloadData];
    [self performBatchUpdates:updates completion:completion];
}

@end

//
//  UICollectionView+CMSAddition.h
//  cosmos
//
//  Created by Lane on 2018/4/30.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (CMSAddition)

- (void)reloadDataWithBatchUpdates:(void (^)(void))updates completion:(void (^)(BOOL finished))completion;

@end

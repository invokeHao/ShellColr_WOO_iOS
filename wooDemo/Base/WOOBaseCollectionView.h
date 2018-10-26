//
//  WOOBaseCollectionView.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^EmptyDataSetTappedBlock)(void);

@interface WOOBaseCollectionView : UICollectionView

@property (nonatomic, strong) MJRefreshComponentRefreshingBlock headerRefreshingBlock;
@property (nonatomic, copy) MJRefreshComponentRefreshingBlock footerRefreshingBlock;

@property (nonatomic, copy) MJRefreshComponentRefreshingBlock FooterRefreshingWithoutTitleBlock;
@property (nonatomic, copy) EmptyDataSetTappedBlock emptyDataSetTappedBlock;

@end

NS_ASSUME_NONNULL_END

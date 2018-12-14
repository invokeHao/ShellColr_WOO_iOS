//
//  WOOMyFavoriteVM.m
//  wooDemo
//
//  Created by colr on 2018/12/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMyFavoriteVM.h"

@interface WOOMyFavoriteVM()

@property (strong, nonatomic)NSArray<WOOGoodsModel*> * dataList;

@end

@implementation WOOMyFavoriteVM

- (instancetype)init {
    self = [super init];
    if (self) {
        [self fetchTheGoodsFavoriteListWithRefreshType:WOORefreshTypeHeader];
    }
    return self;
}

- (void)fetchTheGoodsFavoriteListWithRefreshType:(WOORefreshType)refreshType {
    NSInteger startIndex = 0;
    switch (refreshType) {
        case WOORefreshTypeHeader:
            startIndex = 0;
            break;
        case WOORefreshTypeFooter:
            startIndex = self.dataList.count;
            break;
        default:
            break;
    }
    @weakify(self)
    [WOOFavoriteService getTheFavoriteListWithStartIndex:startIndex completion:^(NSArray<WOOGoodsModel *> * _Nonnull rows, NSError * _Nonnull error) {
        @strongify(self)
        if (!error) {
            switch (refreshType) {
                case WOORefreshTypeHeader: {
                    self.dataList = rows;
                    break;
                }
                case WOORefreshTypeFooter: {
                    self.dataList = [self.dataList arrayByAddingObjectsFromArray:rows];
                    break;
                }
                default:
                    break;
            }
        }
    }];
}


@end

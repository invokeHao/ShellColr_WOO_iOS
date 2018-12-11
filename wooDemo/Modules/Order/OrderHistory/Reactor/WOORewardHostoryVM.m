//
//  WOORewardHostoryVM.m
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOORewardHostoryVM.h"

@interface WOORewardHostoryVM()

@property (strong, nonatomic)NSArray<WOORewardRow*> * dataList;

@end

@implementation WOORewardHostoryVM

- (instancetype)init {
    self = [super init];
    if (self) {
        [self fetchRewardHistoryListWithRefreshType:WOORefreshTypeHeader];
    }
    return self;
}

- (void)fetchRewardHistoryListWithRefreshType:(WOORefreshType)refreshType {
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
    [WOORewardService getTheRewardListStartIndex:startIndex Completion:^(NSArray<WOORewardRow *> * _Nonnull rows, NSError * _Nonnull error) {
        @strongify(self);
        if (error == nil) {
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

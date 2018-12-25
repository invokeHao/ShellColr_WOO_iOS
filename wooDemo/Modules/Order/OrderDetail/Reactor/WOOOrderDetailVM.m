//
//  WOOOrderDetailVM.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOOrderDetailVM.h"
#import "WOORewardService.h"

@interface WOOOrderDetailVM()

@property (nonatomic, copy)NSString * rewardId;

@end

@implementation WOOOrderDetailVM

- (instancetype)initWithRewardId:(NSString *)rewardId {
    self = [super init];
    if (self) {
        _rewardId = rewardId;
        self.orderDetailSubject = [WOOStreamFactory exportFetchSubject];
        [self fetchTheDetailModel];
    }
    return self;
}

- (void)fetchTheDetailModel {
    if (!self.rewardId) {return;}
    @weakify(self)
    [WOORewardService getTheRewardDetailWithRewardId:self.rewardId completion:^(WOORewardRow * _Nonnull row, NSError * _Nonnull error) {
        @strongify(self)
        [self.orderDetailSubject sendNext:row];
        [self.orderDetailSubject sendError:error];
    }];
}

@end

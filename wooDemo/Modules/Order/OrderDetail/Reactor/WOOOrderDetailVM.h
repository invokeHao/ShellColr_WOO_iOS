//
//  WOOOrderDetailVM.h
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOOOrderDetailVM : NSObject

@property (nonatomic, strong) WOOFetchSubject * orderDetailSubject;

- (instancetype)initWithRewardId:(NSString *)rewardId;

- (void)fetchTheDetailModel;

@end

NS_ASSUME_NONNULL_END

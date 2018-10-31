//
//  WOOJiuListDemoModel.h
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"
#import "WOOJIuDemoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOJiuListDemoModel : WOOBaseModel

@property (nonatomic, strong)WOOJIuDemoModel * firstModel;

@property (nonatomic, copy)NSArray * dataArray;

@property (nonatomic, copy)NSArray * bottomArray;

@property (nonatomic, strong)WOOJIuDemoModel * lastModel;

@end

NS_ASSUME_NONNULL_END

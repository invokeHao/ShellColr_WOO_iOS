//
//  WOOASSectionController.h
//  wooDemo
//
//  Created by colr on 2018/11/5.
//  Copyright © 2018 colr. All rights reserved.
//

#import "IGListSectionController.h"
#import "WOOJiuListDemoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOASSectionController : IGListSectionController

@property (nonatomic, copy) WOOJiuListDemoModel * pendingModel;

@end

NS_ASSUME_NONNULL_END

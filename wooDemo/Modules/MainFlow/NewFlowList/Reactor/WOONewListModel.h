//
//  WOONewListModel.h
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOONewListModel : WOOBaseModel

@property (nonatomic, copy)NSArray * TopArray;

@property (nonatomic, copy)NSArray * GoodsArray;

@property (nonatomic, strong)WOOArticleModel * HotVideoModel;

@property (nonatomic, copy)NSArray * BottomArray;

@end

NS_ASSUME_NONNULL_END

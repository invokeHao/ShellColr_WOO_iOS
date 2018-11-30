//
//  WOOJiuListDemoModel.h
//  wooDemo
//
//  Created by colr on 2018/10/29.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"
#import "WOOArticleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOJiuListDemoModel : WOOBaseModel

@property (nonatomic, strong)WOOArticleModel * firstModel;

@property (nonatomic, copy)NSArray * dataArray;

@property (nonatomic, copy)NSArray * bottomArray;

@property (nonatomic, strong)WOOArticleModel * lastModel;

//业务字段
@property (nonatomic, assign)BOOL isRight; //大的在左边还是右边

@end

NS_ASSUME_NONNULL_END

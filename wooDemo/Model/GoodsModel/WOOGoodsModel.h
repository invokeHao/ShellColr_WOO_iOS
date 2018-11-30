//
//  WOOGoodsModel.h
//  wooDemo
//
//  Created by colr on 2018/11/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOGoodsModel : WOOBaseModel

@property (nonatomic, copy)NSString * goodsId; //商品id

@property (nonatomic, copy)NSString * goodsName; //商品名称

@property (nonatomic, copy)NSString * goodsPrice; //商品价格

@property (nonatomic, copy)NSString * goodsDesc; //商品描述

@property (nonatomic, copy)NSString * goodsCoverUrl; //商品封面

@property (nonatomic, copy)NSString * cashBack; //返现

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

- (CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END

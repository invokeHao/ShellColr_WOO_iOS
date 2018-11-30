//
//  WOOGoodsModel.m
//  wooDemo
//
//  Created by colr on 2018/11/26.
//  Copyright © 2018 colr. All rights reserved.
//



#import "WOOGoodsModel.h"

NSString *const KWOOGoodsModelGoodsId = @"goodsId";
NSString *const KWOOGoodsModelGoodsName = @"goodsName";
NSString *const KWOOGoodsModelGoodsDesc = @"goodDesc";
NSString *const KWOOGoodsModelGoodsPrice = @"goodsPrice";
NSString *const KWOOGoodsModelGoodsCoverUrl = @"goodsCoverUrl";
NSString *const KWOOGoodsModelCashBack = @"cashBack";

@implementation WOOGoodsModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (![dictionary[KWOOGoodsModelGoodsId] isKindOfClass:[NSNull class]]) {
        self.goodsId = dictionary[KWOOGoodsModelGoodsId];
    }

    if (![dictionary[KWOOGoodsModelGoodsName] isKindOfClass:[NSNull class]]) {
        self.goodsName = dictionary[KWOOGoodsModelGoodsName];
    }

    if (![dictionary[KWOOGoodsModelGoodsDesc] isKindOfClass:[NSNull class]]) {
        self.goodsDesc = dictionary[KWOOGoodsModelGoodsDesc];
    }

    if (![dictionary[KWOOGoodsModelGoodsPrice] isKindOfClass:[NSNull class]]) {
        self.goodsPrice = dictionary[KWOOGoodsModelGoodsPrice];
    }
    
    if (![dictionary[KWOOGoodsModelGoodsCoverUrl] isKindOfClass:[NSNull class]]) {
        self.goodsCoverUrl = dictionary[KWOOGoodsModelGoodsCoverUrl];
    }

    if (![dictionary[KWOOGoodsModelCashBack] isKindOfClass:[NSNull class]]) {
        self.cashBack = dictionary[KWOOGoodsModelCashBack];
    }

    return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if (dictionary[KWOOGoodsModelGoodsId] != nil) {
        dictionary[KWOOGoodsModelGoodsId] = self.goodsId;
    }
    if (dictionary[KWOOGoodsModelGoodsName] != nil) {
        dictionary[KWOOGoodsModelGoodsName] = self.goodsName;
    }
    if (dictionary[KWOOGoodsModelGoodsCoverUrl] != nil) {
        dictionary[KWOOGoodsModelGoodsCoverUrl] = self.goodsCoverUrl;
    }
    if (dictionary[KWOOGoodsModelGoodsPrice] != nil) {
        dictionary[KWOOGoodsModelGoodsPrice] = self.goodsPrice;
    }
    if (dictionary[KWOOGoodsModelGoodsDesc] != nil) {
        dictionary[KWOOGoodsModelGoodsDesc] = self.goodsDesc;
    }
    if (dictionary[KWOOGoodsModelCashBack] != nil) {
        dictionary[KWOOGoodsModelCashBack] = self.cashBack;
    }
    return dictionary;
}

- (CGFloat)cellHeight {
    CGFloat coverH = 360 * VERTICAL_SCREEN_WIDTH / 414;
    CGFloat textH = [self.goodsName sizeWithFont:WOOFont(24) maxSize:CGSizeMake(VERTICAL_SCREEN_WIDTH - 90, MAXFLOAT)].height;
    return coverH + textH + 40;
}

@end

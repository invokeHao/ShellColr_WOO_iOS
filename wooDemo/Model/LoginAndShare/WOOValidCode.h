//
//  WOOValidCode.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOValidCode : WOOBaseModel

@property (nonatomic, assign) BOOL sent;
@property (nonatomic, strong) NSString * verifyCode;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

NS_ASSUME_NONNULL_END

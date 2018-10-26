//
//  WOOMobileAuth.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOMobileAuth : WOOBaseModel

@property (nonatomic, strong) NSString * authDesc;
@property (nonatomic, strong) NSString * authNo;
@property (nonatomic, strong) NSString * authValue;
@property (nonatomic, assign) NSInteger authValueType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

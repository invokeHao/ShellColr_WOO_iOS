//
//  WOOAuthToken.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOAuthToken : WOOBaseModel

@property (nonatomic, assign) NSInteger accessExpire;
@property (nonatomic, strong) NSString * accessToken;
@property (nonatomic, assign) NSInteger refreshExpire;
@property (nonatomic, strong) NSString * refreshToken;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END

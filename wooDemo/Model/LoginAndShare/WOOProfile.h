//
//  WOOProfile.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"
#import "WOOHeadIcon.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOProfile : WOOBaseModel

@property (nonatomic, assign) NSInteger articleAmount;
@property (nonatomic, strong) NSString * birthdate;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * country;
@property (nonatomic, assign) NSInteger createdCircleAmount;
@property (nonatomic, assign) NSInteger genderId;
@property (nonatomic, strong) WOOHeadIcon * headIcon;
@property (nonatomic, strong) NSString * imToken;
@property (nonatomic, strong) NSString * imUserNo;
@property (nonatomic, assign) NSInteger joinedCircleAmount;
@property (nonatomic, assign) NSInteger managedCircleAmount;
@property (nonatomic, assign) NSInteger moCoinAmount;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, strong) NSString * moCoinAmountStr;
@property (nonatomic, strong) NSString * profileDesc;
@property (nonatomic, strong) NSString * province;
@property (nonatomic, strong) NSString * userNo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

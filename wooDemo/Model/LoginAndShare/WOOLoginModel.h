//
//  WOOLoginModel.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"
#import "WOOAuthToken.h"
#import "WOOMobileAuth.h"
#import "WOOProfile.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOLoginModel : WOOBaseModel

@property (nonatomic, assign) BOOL newProfile;
@property (nonatomic, strong) WOOAuthToken * authToken;
@property (nonatomic, strong) WOOMobileAuth * mobileAuth;
@property (nonatomic, strong) WOOProfile * profile;
@property (nonatomic, strong) WOOMobileAuth * qqAuth;
@property (nonatomic, strong) WOOMobileAuth * wbAuth;
@property (nonatomic, strong) WOOMobileAuth * wxAuth;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

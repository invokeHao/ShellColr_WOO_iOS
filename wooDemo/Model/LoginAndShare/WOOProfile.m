//
//  WOOProfile.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOProfile.h"

NSString *const kWOOProfileArticleAmount = @"articleAmount";
NSString *const kWOOProfileBirthdate = @"birthdate";
NSString *const kWOOProfileCity = @"city";
NSString *const kWOOProfileCountry = @"country";
NSString *const kWOOProfileCreatedCircleAmount = @"createdCircleAmount";
NSString *const kWOOProfileGenderId = @"genderId";
NSString *const kWOOProfileHeadIcon = @"headIcon";
NSString *const kWOOProfileImToken = @"imToken";
NSString *const kWOOProfileImUserNo = @"imUserNo";
NSString *const kWOOProfileJoinedCircleAmount = @"joinedCircleAmount";
NSString *const kWOOProfileManagedCircleAmount = @"managedCircleAmount";
NSString *const kWOOProfileMoCoinAmount = @"moCoinAmount";
NSString *const kWOOProfileNickname = @"nickname";
NSString *const kWOOProfileMoCoinAmountStr = @"moCoinAmountStr";
NSString *const kWOOProfileProfileDesc = @"profileDesc";
NSString *const kWOOProfileProvince = @"province";
NSString *const kWOOProfileUserNo = @"userNo";

@interface WOOProfile ()
@end
@implementation WOOProfile




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOProfileArticleAmount] isKindOfClass:[NSNull class]]){
        self.articleAmount = [dictionary[kWOOProfileArticleAmount] integerValue];
    }
    
    if(![dictionary[kWOOProfileBirthdate] isKindOfClass:[NSNull class]]){
        self.birthdate = dictionary[kWOOProfileBirthdate];
    }
    if(![dictionary[kWOOProfileCity] isKindOfClass:[NSNull class]]){
        self.city = dictionary[kWOOProfileCity];
    }
    if(![dictionary[kWOOProfileCountry] isKindOfClass:[NSNull class]]){
        self.country = dictionary[kWOOProfileCountry];
    }
    if(![dictionary[kWOOProfileCreatedCircleAmount] isKindOfClass:[NSNull class]]){
        self.createdCircleAmount = [dictionary[kWOOProfileCreatedCircleAmount] integerValue];
    }
    
    if(![dictionary[kWOOProfileGenderId] isKindOfClass:[NSNull class]]){
        self.genderId = [dictionary[kWOOProfileGenderId] integerValue];
    }

    if(![dictionary[kWOOProfileHeadIcon] isKindOfClass:[NSNull class]]){
        self.headIcon = [[WOOHeadIcon alloc] initWithDictionary:dictionary[kWOOProfileHeadIcon]];
    }
    
    if(![dictionary[kWOOProfileImToken] isKindOfClass:[NSNull class]]){
        self.imToken = dictionary[kWOOProfileImToken];
    }
    if(![dictionary[kWOOProfileImUserNo] isKindOfClass:[NSNull class]]){
        self.imUserNo = dictionary[kWOOProfileImUserNo];
    }
    if(![dictionary[kWOOProfileJoinedCircleAmount] isKindOfClass:[NSNull class]]){
        self.joinedCircleAmount = [dictionary[kWOOProfileJoinedCircleAmount] integerValue];
    }
    
    if(![dictionary[kWOOProfileManagedCircleAmount] isKindOfClass:[NSNull class]]){
        self.managedCircleAmount = [dictionary[kWOOProfileManagedCircleAmount] integerValue];
    }
    
    if(![dictionary[kWOOProfileMoCoinAmount] isKindOfClass:[NSNull class]]){
        self.moCoinAmount = [dictionary[kWOOProfileMoCoinAmount] integerValue];
    }
    
    if(![dictionary[kWOOProfileNickname] isKindOfClass:[NSNull class]]){
        self.nickname = dictionary[kWOOProfileNickname];
    }
    if(![dictionary[kWOOProfileMoCoinAmountStr] isKindOfClass:[NSNull class]]){
        self.moCoinAmountStr = dictionary[kWOOProfileMoCoinAmountStr];
    }
    if(![dictionary[kWOOProfileProfileDesc] isKindOfClass:[NSNull class]]){
        self.profileDesc = dictionary[kWOOProfileProfileDesc];
    }
    if(![dictionary[kWOOProfileProvince] isKindOfClass:[NSNull class]]){
        self.province = dictionary[kWOOProfileProvince];
    }
    if(![dictionary[kWOOProfileUserNo] isKindOfClass:[NSNull class]]){
        self.userNo = dictionary[kWOOProfileUserNo];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kWOOProfileArticleAmount] = @(self.articleAmount);
    if(self.birthdate != nil){
        dictionary[kWOOProfileBirthdate] = self.birthdate;
    }
    if(self.city != nil){
        dictionary[kWOOProfileCity] = self.city;
    }
    if(self.country != nil){
        dictionary[kWOOProfileCountry] = self.country;
    }
    dictionary[kWOOProfileCreatedCircleAmount] = @(self.createdCircleAmount);
    dictionary[kWOOProfileGenderId] = @(self.genderId);
    if(self.headIcon != nil){
        dictionary[kWOOProfileHeadIcon] = [self.headIcon toDictionary];
    }
    if(self.imToken != nil){
        dictionary[kWOOProfileImToken] = self.imToken;
    }
    if(self.imUserNo != nil){
        dictionary[kWOOProfileImUserNo] = self.imUserNo;
    }
    dictionary[kWOOProfileJoinedCircleAmount] = @(self.joinedCircleAmount);
    dictionary[kWOOProfileManagedCircleAmount] = @(self.managedCircleAmount);
    dictionary[kWOOProfileMoCoinAmount] = @(self.moCoinAmount);
    if(self.nickname != nil){
        dictionary[kWOOProfileNickname] = self.nickname;
    }
    if(self.moCoinAmountStr != nil){
        dictionary[kWOOProfileMoCoinAmountStr] = self.moCoinAmountStr;
    }
    if(self.profileDesc != nil){
        dictionary[kWOOProfileProfileDesc] = self.profileDesc;
    }
    if(self.province != nil){
        dictionary[kWOOProfileProvince] = self.province;
    }
    if(self.userNo != nil){
        dictionary[kWOOProfileUserNo] = self.userNo;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.articleAmount) forKey:kWOOProfileArticleAmount];    if(self.birthdate != nil){
        [aCoder encodeObject:self.birthdate forKey:kWOOProfileBirthdate];
    }
    if(self.city != nil){
        [aCoder encodeObject:self.city forKey:kWOOProfileCity];
    }
    if(self.country != nil){
        [aCoder encodeObject:self.country forKey:kWOOProfileCountry];
    }
    [aCoder encodeObject:@(self.createdCircleAmount) forKey:kWOOProfileCreatedCircleAmount];    [aCoder encodeObject:@(self.genderId) forKey:kWOOProfileGenderId];
    if(self.headIcon != nil){
        [aCoder encodeObject:self.headIcon forKey:kWOOProfileHeadIcon];
    }
    if(self.imToken != nil){
        [aCoder encodeObject:self.imToken forKey:kWOOProfileImToken];
    }
    if(self.imUserNo != nil){
        [aCoder encodeObject:self.imUserNo forKey:kWOOProfileImUserNo];
    }
    [aCoder encodeObject:@(self.joinedCircleAmount) forKey:kWOOProfileJoinedCircleAmount];    [aCoder encodeObject:@(self.managedCircleAmount) forKey:kWOOProfileManagedCircleAmount];    [aCoder encodeObject:@(self.moCoinAmount) forKey:kWOOProfileMoCoinAmount];
    if(self.nickname != nil){
        [aCoder encodeObject:self.nickname forKey:kWOOProfileNickname];
    }
    if(self.moCoinAmountStr != nil){
        [aCoder encodeObject:self.moCoinAmountStr forKey:kWOOProfileMoCoinAmountStr];
    }
    
    if(self.profileDesc != nil){
        [aCoder encodeObject:self.profileDesc forKey:kWOOProfileProfileDesc];
    }
    if(self.province != nil){
        [aCoder encodeObject:self.province forKey:kWOOProfileProvince];
    }
    if(self.userNo != nil){
        [aCoder encodeObject:self.userNo forKey:kWOOProfileUserNo];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.articleAmount = [[aDecoder decodeObjectForKey:kWOOProfileArticleAmount] integerValue];
    self.birthdate = [aDecoder decodeObjectForKey:kWOOProfileBirthdate];
    self.city = [aDecoder decodeObjectForKey:kWOOProfileCity];
    self.country = [aDecoder decodeObjectForKey:kWOOProfileCountry];
    self.createdCircleAmount = [[aDecoder decodeObjectForKey:kWOOProfileCreatedCircleAmount] integerValue];
    self.genderId = [[aDecoder decodeObjectForKey:kWOOProfileGenderId] integerValue];
    self.headIcon = [aDecoder decodeObjectForKey:kWOOProfileHeadIcon];
    self.imToken = [aDecoder decodeObjectForKey:kWOOProfileImToken];
    self.imUserNo = [aDecoder decodeObjectForKey:kWOOProfileImUserNo];
    self.joinedCircleAmount = [[aDecoder decodeObjectForKey:kWOOProfileJoinedCircleAmount] integerValue];
    self.managedCircleAmount = [[aDecoder decodeObjectForKey:kWOOProfileManagedCircleAmount] integerValue];
    self.moCoinAmount = [[aDecoder decodeObjectForKey:kWOOProfileMoCoinAmount] integerValue];
    self.nickname = [aDecoder decodeObjectForKey:kWOOProfileNickname];
    self.moCoinAmountStr = [aDecoder decodeObjectForKey:kWOOProfileMoCoinAmountStr];
    self.profileDesc = [aDecoder decodeObjectForKey:kWOOProfileProfileDesc];
    self.province = [aDecoder decodeObjectForKey:kWOOProfileProvince];
    self.userNo = [aDecoder decodeObjectForKey:kWOOProfileUserNo];
    return self;
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOProfile *copy = [WOOProfile new];
    
    copy.articleAmount = self.articleAmount;
    copy.birthdate = [self.birthdate copy];
    copy.city = [self.city copy];
    copy.country = [self.country copy];
    copy.createdCircleAmount = self.createdCircleAmount;
    copy.genderId = self.genderId;
    copy.headIcon = [self.headIcon copy];
    copy.imToken = [self.imToken copy];
    copy.imUserNo = [self.imUserNo copy];
    copy.joinedCircleAmount = self.joinedCircleAmount;
    copy.managedCircleAmount = self.managedCircleAmount;
    copy.moCoinAmount = self.moCoinAmount;
    copy.nickname = [self.nickname copy];
    copy.moCoinAmountStr = [self.moCoinAmountStr copy];
    copy.profileDesc = [self.profileDesc copy];
    copy.province = [self.province copy];
    copy.userNo = [self.userNo copy];
    
    return copy;
}

@end

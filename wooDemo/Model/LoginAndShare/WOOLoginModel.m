//
//  WOOLoginModel.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOLoginModel.h"

NSString *const kWOOLoginModelNewProfile = @"newProfile";
NSString *const kWOOLoginModelAuthToken = @"authToken";
NSString *const kWOOLoginModelMobileAuth = @"mobileAuth";
NSString *const kWOOLoginModelProfile = @"profile";
NSString *const kWOOLoginModelQqAuth = @"qqAuth";
NSString *const kWOOLoginModelWbAuth = @"wbAuth";
NSString *const kWOOLoginModelWxAuth = @"wxAuth";

@interface WOOLoginModel ()
@end
@implementation WOOLoginModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOLoginModelNewProfile] isKindOfClass:[NSNull class]]){
        self.newProfile = [dictionary[kWOOLoginModelNewProfile] boolValue];
    }
    if(![dictionary[kWOOLoginModelAuthToken] isKindOfClass:[NSNull class]]){
        self.authToken = [[WOOAuthToken alloc] initWithDictionary:dictionary[kWOOLoginModelAuthToken]];
    }
    
    if(![dictionary[kWOOLoginModelMobileAuth] isKindOfClass:[NSNull class]]){
        self.mobileAuth = [[WOOMobileAuth alloc] initWithDictionary:dictionary[kWOOLoginModelMobileAuth]];
    }
    
    if(![dictionary[kWOOLoginModelProfile] isKindOfClass:[NSNull class]]){
        self.profile = [[WOOProfile alloc] initWithDictionary:dictionary[kWOOLoginModelProfile]];
    }
    
    if(![dictionary[kWOOLoginModelQqAuth] isKindOfClass:[NSNull class]]){
        self.qqAuth = [[WOOMobileAuth alloc] initWithDictionary:dictionary[kWOOLoginModelQqAuth]];
    }
    
    if(![dictionary[kWOOLoginModelWbAuth] isKindOfClass:[NSNull class]]){
        self.wbAuth = [[WOOMobileAuth alloc] initWithDictionary:dictionary[kWOOLoginModelWbAuth]];
    }
    
    if(![dictionary[kWOOLoginModelWxAuth] isKindOfClass:[NSNull class]]){
        self.wxAuth = [[WOOMobileAuth alloc] initWithDictionary:dictionary[kWOOLoginModelWxAuth]];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kWOOLoginModelNewProfile] = @(self.newProfile);
    if(self.authToken != nil){
        dictionary[kWOOLoginModelAuthToken] = [self.authToken toDictionary];
    }
    if(self.mobileAuth != nil){
        dictionary[kWOOLoginModelMobileAuth] = [self.mobileAuth toDictionary];
    }
    if(self.profile != nil){
        dictionary[kWOOLoginModelProfile] = [self.profile toDictionary];
    }
    if(self.qqAuth != nil){
        dictionary[kWOOLoginModelQqAuth] = [self.qqAuth toDictionary];
    }
    if(self.wbAuth != nil){
        dictionary[kWOOLoginModelWbAuth] = [self.wbAuth toDictionary];
    }
    if(self.wxAuth != nil){
        dictionary[kWOOLoginModelWxAuth] = [self.wxAuth toDictionary];
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
    [aCoder encodeObject:@(self.newProfile) forKey:kWOOLoginModelNewProfile];
    if(self.authToken != nil){
        [aCoder encodeObject:self.authToken forKey:kWOOLoginModelAuthToken];
    }
    if(self.mobileAuth != nil){
        [aCoder encodeObject:self.mobileAuth forKey:kWOOLoginModelMobileAuth];
    }
    if(self.profile != nil){
        [aCoder encodeObject:self.profile forKey:kWOOLoginModelProfile];
    }
    if(self.qqAuth != nil){
        [aCoder encodeObject:self.qqAuth forKey:kWOOLoginModelQqAuth];
    }
    if(self.wbAuth != nil){
        [aCoder encodeObject:self.wbAuth forKey:kWOOLoginModelWbAuth];
    }
    if(self.wxAuth != nil){
        [aCoder encodeObject:self.wxAuth forKey:kWOOLoginModelWxAuth];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.newProfile = [[aDecoder decodeObjectForKey:kWOOLoginModelNewProfile] boolValue];
    self.authToken = [aDecoder decodeObjectForKey:kWOOLoginModelAuthToken];
    self.mobileAuth = [aDecoder decodeObjectForKey:kWOOLoginModelMobileAuth];
    self.profile = [aDecoder decodeObjectForKey:kWOOLoginModelProfile];
    self.qqAuth = [aDecoder decodeObjectForKey:kWOOLoginModelQqAuth];
    self.wbAuth = [aDecoder decodeObjectForKey:kWOOLoginModelWbAuth];
    self.wxAuth = [aDecoder decodeObjectForKey:kWOOLoginModelWxAuth];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOLoginModel *copy = [WOOLoginModel new];
    
    copy.newProfile = self.newProfile;
    copy.authToken = [self.authToken copy];
    copy.mobileAuth = [self.mobileAuth copy];
    copy.profile = [self.profile copy];
    copy.qqAuth = [self.qqAuth copy];
    copy.wbAuth = [self.wbAuth copy];
    copy.wxAuth = [self.wxAuth copy];
    
    return copy;
}

@end

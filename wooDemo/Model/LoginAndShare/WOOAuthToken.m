//
//  WOOAuthToken.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOAuthToken.h"

NSString *const kWOOAuthTokenAccessExpire = @"accessExpire";
NSString *const kWOOAuthTokenAccessToken = @"accessToken";
NSString *const kWOOAuthTokenRefreshExpire = @"refreshExpire";
NSString *const kWOOAuthTokenRefreshToken = @"refreshToken";

@interface WOOAuthToken ()
@end
@implementation WOOAuthToken
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOAuthTokenAccessExpire] isKindOfClass:[NSNull class]]){
        self.accessExpire = [dictionary[kWOOAuthTokenAccessExpire] integerValue];
    }
    if(![dictionary[kWOOAuthTokenAccessToken] isKindOfClass:[NSNull class]]){
        self.accessToken = dictionary[kWOOAuthTokenAccessToken];
    }
    if(![dictionary[kWOOAuthTokenRefreshExpire] isKindOfClass:[NSNull class]]){
        self.refreshExpire = [dictionary[kWOOAuthTokenRefreshExpire] integerValue];
    }
    if(![dictionary[kWOOAuthTokenRefreshToken] isKindOfClass:[NSNull class]]){
        self.refreshToken = dictionary[kWOOAuthTokenRefreshToken];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kWOOAuthTokenAccessExpire] = @(self.accessExpire);
    if(self.accessToken != nil){
        dictionary[kWOOAuthTokenAccessToken] = self.accessToken;
    }
    dictionary[kWOOAuthTokenRefreshExpire] = @(self.refreshExpire);
    if(self.refreshToken != nil){
        dictionary[kWOOAuthTokenRefreshToken] = self.refreshToken;
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
    [aCoder encodeObject:@(self.accessExpire) forKey:kWOOAuthTokenAccessExpire];
    if(self.accessToken != nil){
        [aCoder encodeObject:self.accessToken forKey:kWOOAuthTokenAccessToken];
    }
    [aCoder encodeObject:@(self.refreshExpire) forKey:kWOOAuthTokenRefreshExpire];
    if(self.refreshToken != nil){
        [aCoder encodeObject:self.refreshToken forKey:kWOOAuthTokenRefreshToken];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.accessExpire = [[aDecoder decodeObjectForKey:kWOOAuthTokenAccessExpire] integerValue];
    self.accessToken = [aDecoder decodeObjectForKey:kWOOAuthTokenAccessToken];
    self.refreshExpire = [[aDecoder decodeObjectForKey:kWOOAuthTokenRefreshExpire] integerValue];
    self.refreshToken = [aDecoder decodeObjectForKey:kWOOAuthTokenRefreshToken];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOAuthToken *copy = [WOOAuthToken new];
    
    copy.accessExpire = self.accessExpire;
    copy.accessToken = [self.accessToken copy];
    copy.refreshExpire = self.refreshExpire;
    copy.refreshToken = [self.refreshToken copy];
    
    return copy;
}

@end

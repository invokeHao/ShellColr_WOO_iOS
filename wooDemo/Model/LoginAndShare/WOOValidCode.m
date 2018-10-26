//
//  WOOValidCode.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOValidCode.h"

NSString *const kWOOValidCodeSent = @"sent";
NSString *const kWOOValidCodeVerifyCode = @"verifyCode";

@interface WOOValidCode ()
@end
@implementation WOOValidCode




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOValidCodeSent] isKindOfClass:[NSNull class]]){
        self.sent = [dictionary[kWOOValidCodeSent] boolValue];
    }
    
    if(![dictionary[kWOOValidCodeVerifyCode] isKindOfClass:[NSNull class]]){
        self.verifyCode = dictionary[kWOOValidCodeVerifyCode];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kWOOValidCodeSent] = @(self.sent);
    if(self.verifyCode != nil){
        dictionary[kWOOValidCodeVerifyCode] = self.verifyCode;
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
    [aCoder encodeObject:@(self.sent) forKey:kWOOValidCodeSent];    if(self.verifyCode != nil){
        [aCoder encodeObject:self.verifyCode forKey:kWOOValidCodeVerifyCode];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.sent = [[aDecoder decodeObjectForKey:kWOOValidCodeSent] boolValue];
    self.verifyCode = [aDecoder decodeObjectForKey:kWOOValidCodeVerifyCode];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOValidCode *copy = [WOOValidCode new];
    
    copy.sent = self.sent;
    copy.verifyCode = [self.verifyCode copy];
    
    return copy;
}

@end

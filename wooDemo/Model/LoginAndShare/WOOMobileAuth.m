//
//  WOOMobileAuth.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMobileAuth.h"

NSString *const kWOOMobileAuthAuthDesc = @"authDesc";
NSString *const kWOOMobileAuthAuthNo = @"authNo";
NSString *const kWOOMobileAuthAuthValue = @"authValue";
NSString *const kWOOMobileAuthAuthValueType = @"authValueType";

@interface WOOMobileAuth ()
@end
@implementation WOOMobileAuth




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOMobileAuthAuthDesc] isKindOfClass:[NSNull class]]){
        self.authDesc = dictionary[kWOOMobileAuthAuthDesc];
    }
    if(![dictionary[kWOOMobileAuthAuthNo] isKindOfClass:[NSNull class]]){
        self.authNo = dictionary[kWOOMobileAuthAuthNo];
    }
    if(![dictionary[kWOOMobileAuthAuthValue] isKindOfClass:[NSNull class]]){
        self.authValue = dictionary[kWOOMobileAuthAuthValue];
    }
    if(![dictionary[kWOOMobileAuthAuthValueType] isKindOfClass:[NSNull class]]){
        self.authValueType = [dictionary[kWOOMobileAuthAuthValueType] integerValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.authDesc != nil){
        dictionary[kWOOMobileAuthAuthDesc] = self.authDesc;
    }
    if(self.authNo != nil){
        dictionary[kWOOMobileAuthAuthNo] = self.authNo;
    }
    if(self.authValue != nil){
        dictionary[kWOOMobileAuthAuthValue] = self.authValue;
    }
    dictionary[kWOOMobileAuthAuthValueType] = @(self.authValueType);
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
    if(self.authDesc != nil){
        [aCoder encodeObject:self.authDesc forKey:kWOOMobileAuthAuthDesc];
    }
    if(self.authNo != nil){
        [aCoder encodeObject:self.authNo forKey:kWOOMobileAuthAuthNo];
    }
    if(self.authValue != nil){
        [aCoder encodeObject:self.authValue forKey:kWOOMobileAuthAuthValue];
    }
    [aCoder encodeObject:@(self.authValueType) forKey:kWOOMobileAuthAuthValueType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.authDesc = [aDecoder decodeObjectForKey:kWOOMobileAuthAuthDesc];
    self.authNo = [aDecoder decodeObjectForKey:kWOOMobileAuthAuthNo];
    self.authValue = [aDecoder decodeObjectForKey:kWOOMobileAuthAuthValue];
    self.authValueType = [[aDecoder decodeObjectForKey:kWOOMobileAuthAuthValueType] integerValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOMobileAuth *copy = [WOOMobileAuth new];
    
    copy.authDesc = [self.authDesc copy];
    copy.authNo = [self.authNo copy];
    copy.authValue = [self.authValue copy];
    copy.authValueType = self.authValueType;
    
    return copy;
}

@end

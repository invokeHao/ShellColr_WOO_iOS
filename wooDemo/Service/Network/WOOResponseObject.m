//
//  CMSResponseObject.m
//  cosmos
//
//  Created by 周凌宇 on 2018/4/13.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "WOOResponseObject.h"

NSString *const kWOOResponseObjectCode = @"code";
NSString *const kWOOResponseObjectErrorDesc = @"errorDesc";
NSString *const kWOOResponseObjectErrorId = @"errorId";
NSString *const kWOOResponseObjectResult = @"result";


@interface WOOResponseObject ()
@end
@implementation WOOResponseObject

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOResponseObjectCode] isKindOfClass:[NSNull class]]){
        self.code = [dictionary[kWOOResponseObjectCode] integerValue];
    }
    if(![dictionary[kWOOResponseObjectErrorDesc] isKindOfClass:[NSNull class]]){
        self.errorDesc = dictionary[kWOOResponseObjectErrorDesc];
    }
    if(![dictionary[kWOOResponseObjectErrorId] isKindOfClass:[NSNull class]]){
        self.errorId = [dictionary[kWOOResponseObjectErrorId] integerValue];
    }
    if(![dictionary[kWOOResponseObjectResult] isKindOfClass:[NSNull class]]){
        self.result = dictionary[kWOOResponseObjectResult];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kWOOResponseObjectCode] = @(self.code);
    if(self.errorDesc != nil){
        dictionary[kWOOResponseObjectErrorDesc] = self.errorDesc;
    }
    dictionary[kWOOResponseObjectErrorId] = @(self.errorId);
    if(self.result != nil){
        dictionary[kWOOResponseObjectResult] = self.result;
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
    [aCoder encodeObject:@(self.code) forKey:kWOOResponseObjectCode];
    [aCoder encodeObject:@(self.errorId) forKey:kWOOResponseObjectErrorId];
    if(self.errorDesc != nil){
        [aCoder encodeObject:self.errorDesc forKey:kWOOResponseObjectErrorDesc];
    }
    if(self.result != nil){
        [aCoder encodeObject:self.result forKey:kWOOResponseObjectResult];
    }
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.code = [[aDecoder decodeObjectForKey:kWOOResponseObjectCode] integerValue];
    self.errorId = [[aDecoder decodeObjectForKey:kWOOResponseObjectErrorId] integerValue];
    self.errorDesc = [aDecoder decodeObjectForKey:kWOOResponseObjectErrorDesc];
    self.result = [aDecoder decodeObjectForKey:kWOOResponseObjectResult];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOResponseObject *copy = [WOOResponseObject new];
    
    copy.code = self.code;
    copy.errorId = self.errorId;
    copy.errorDesc = [self.errorDesc copy];
    copy.result = [self.result copy];
    
    return copy;
}


@end

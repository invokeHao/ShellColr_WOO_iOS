//
//  WOOApiHostModel.m
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOApiHostModel.h"

NSString *const kWOOApiHostErrorInterval = @"error_interval";
NSString *const kWOOApiHostPattern = @"pattern";
NSString *const kWOOApiHostSampleRatio = @"sample_ratio";
NSString *const kWOOApiHostReportServerError = @"report_server_error";

@implementation WOOApiHostModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOApiHostErrorInterval] isKindOfClass:[NSNull class]]){
        self.error_interval = [dictionary[kWOOApiHostErrorInterval] integerValue];
    }
    if(![dictionary[kWOOApiHostPattern] isKindOfClass:[NSNull class]]){
        self.pattern = dictionary[kWOOApiHostPattern];
    }
    if(![dictionary[kWOOApiHostSampleRatio] isKindOfClass:[NSNull class]]){
        self.sample_ratio = [dictionary[kWOOApiHostSampleRatio] integerValue];
    }
    if(![dictionary[kWOOApiHostReportServerError] isKindOfClass:[NSNull class]]){
        self.report_server_error = [dictionary[kWOOApiHostReportServerError] integerValue];
    }
    return self;
}

/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kWOOApiHostErrorInterval] = @(self.error_interval);
    if(self.pattern != nil){
        dictionary[kWOOApiHostPattern] = self.pattern;
    }
    dictionary[kWOOApiHostSampleRatio] = @(self.sample_ratio);
    dictionary[kWOOApiHostReportServerError] = @(self.report_server_error);
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
    [aCoder encodeObject:@(self.error_interval) forKey:kWOOApiHostErrorInterval];
    if(self.pattern != nil){
        [aCoder encodeObject:self.pattern forKey:kWOOApiHostPattern];
    }
    [aCoder encodeObject:@(self.sample_ratio) forKey:kWOOApiHostSampleRatio];
    [aCoder encodeObject:@(self.report_server_error) forKey:kWOOApiHostReportServerError];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.error_interval = [[aDecoder decodeObjectForKey:kWOOApiHostErrorInterval] integerValue];
    self.pattern = [aDecoder decodeObjectForKey:kWOOApiHostPattern];
    self.sample_ratio = [[aDecoder decodeObjectForKey:kWOOApiHostSampleRatio] integerValue];
    self.report_server_error = [[aDecoder decodeObjectForKey:kWOOApiHostReportServerError] integerValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOApiHostModel *copy = [WOOApiHostModel new];
    copy.error_interval = self.error_interval;
    copy.pattern = [self.pattern copy];
    copy.sample_ratio = self.sample_ratio;
    copy.report_server_error = self.report_server_error;
    return copy;
}


@end

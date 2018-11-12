//
//  WOOTipsModel.m
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOTipsModel.h"

NSString *const kWOOTipsType = @"type";
NSString *const kWOOTipsDisplyDuration = @"display_duration";
NSString *const kWOOTipsDisplyInfo = @"display_info";
NSString *const kWOOTipsDisplyTemplate = @"display_template"; //样板
NSString *const kWOOTipsOpenUrl = @"open_url";
NSString *const kWOOTipsWebUrl = @"web_url";
NSString *const kWOOTipsDownloadUrl = @"download_url";
NSString *const kWOOTipsAppName = @"app_name";
NSString *const kWOOTipsPackageName = @"package_name";

@implementation WOOTipsModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOTipsType] isKindOfClass:[NSNull class]]){
        self.type = dictionary[kWOOTipsType];
    }
    if(![dictionary[kWOOTipsDisplyDuration] isKindOfClass:[NSNull class]]){
        self.display_duration = [dictionary[kWOOTipsDisplyDuration] integerValue];
    }
    if(![dictionary[kWOOTipsDisplyInfo] isKindOfClass:[NSNull class]]){
        self.display_info = dictionary[kWOOTipsDisplyInfo];
    }
    if(![dictionary[kWOOTipsDisplyTemplate] isKindOfClass:[NSNull class]]){
        self.display_template = dictionary[kWOOTipsDisplyTemplate];
    }
    if(![dictionary[kWOOTipsOpenUrl] isKindOfClass:[NSNull class]]){
        self.open_url = dictionary[kWOOTipsOpenUrl];
    }
    if(![dictionary[kWOOTipsWebUrl] isKindOfClass:[NSNull class]]){
        self.web_url = dictionary[kWOOTipsWebUrl];
    }
    if(![dictionary[kWOOTipsDownloadUrl] isKindOfClass:[NSNull class]]){
        self.download_url = dictionary[kWOOTipsDownloadUrl];
    }
    if(![dictionary[kWOOTipsAppName] isKindOfClass:[NSNull class]]){
        self.app_name = dictionary[kWOOTipsAppName];
    }
    if(![dictionary[kWOOTipsPackageName] isKindOfClass:[NSNull class]]){
        self.package_name = dictionary[kWOOTipsPackageName];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.type != nil){
        dictionary[kWOOTipsType] = self.type;
    }
    dictionary[kWOOTipsDisplyDuration] = @(self.display_duration);
    if(self.display_info != nil){
        dictionary[kWOOTipsDisplyInfo] = self.display_info;
    }
    if(self.display_template != nil){
        dictionary[kWOOTipsDisplyTemplate] = self.display_template;
    }
    if(self.open_url != nil){
        dictionary[kWOOTipsOpenUrl] = self.open_url;
    }
    if(self.web_url != nil){
        dictionary[kWOOTipsWebUrl] = self.web_url;
    }
    if(self.download_url != nil){
        dictionary[kWOOTipsDownloadUrl] = self.download_url;
    }
    if(self.package_name != nil){
        dictionary[kWOOTipsPackageName] = self.package_name;
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
    if(self.type != nil){
        [aCoder encodeObject:self.type forKey:kWOOTipsType];
    }
    [aCoder encodeObject:@(self.display_duration) forKey:kWOOTipsDisplyDuration];
    if(self.display_info != nil){
        [aCoder encodeObject:self.display_info forKey:kWOOTipsDisplyInfo];
    }
    if(self.display_template != nil){
        [aCoder encodeObject:self.display_template forKey:kWOOTipsDisplyTemplate];
    }
    if(self.open_url != nil){
        [aCoder encodeObject:self.open_url forKey:kWOOTipsOpenUrl];
    }
    if(self.web_url != nil){
        [aCoder encodeObject:self.web_url forKey:kWOOTipsWebUrl];
    }
    if(self.download_url != nil){
        [aCoder encodeObject:self.download_url forKey:kWOOTipsDownloadUrl];
    }
    if(self.app_name != nil){
        [aCoder encodeObject:self.app_name forKey:kWOOTipsAppName];
    }
    if(self.package_name != nil){
        [aCoder encodeObject:self.package_name forKey:kWOOTipsPackageName];
    }
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.type = [aDecoder decodeObjectForKey:kWOOTipsType];
    self.display_duration = [[aDecoder decodeObjectForKey:kWOOTipsDisplyDuration] integerValue];
    self.display_info = [aDecoder decodeObjectForKey:kWOOTipsDisplyInfo];
    self.display_template = [aDecoder decodeObjectForKey:kWOOTipsDisplyTemplate];
    self.open_url = [aDecoder decodeObjectForKey:kWOOTipsOpenUrl];
    self.web_url = [aDecoder decodeObjectForKey:kWOOTipsWebUrl];
    self.download_url = [aDecoder decodeObjectForKey:kWOOTipsDownloadUrl];
    self.app_name = [aDecoder decodeObjectForKey:kWOOTipsAppName];
    self.package_name = [aDecoder decodeObjectForKey:kWOOTipsPackageName];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOTipsModel *copy = [WOOTipsModel new];
    
    copy.type = [self.type copy];
    copy.display_duration = self.display_duration;
    copy.display_info = [self.display_info copy];
    copy.display_template = [self.display_template copy];
    copy.open_url = [self.open_url copy];
    copy.web_url = [self.web_url copy];
    copy.download_url = [self.download_url copy];
    copy.app_name = [self.app_name copy];
    copy.package_name = [self.package_name copy];
    
    return copy;
}


@end

//
//  WOOArticleModel.m
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOArticleModel.h"

NSString *const kWOOArticleAbstract = @"abstract";
NSString *const kWOOArticleTitle = @"title";
NSString *const kWOOArticleHasVideo = @"has_video";
NSString *const kWOOArticleDisplayUrl = @"display_url";
NSString *const kWOOArticleGroupId = @"group_id";
NSString *const kWOOArticleVideoId = @"video_id";
NSString *const kWOOArticleSource = @"source";
NSString *const kWOOArticleMiddleImage = @"middle_image";
NSString *const kWOOArticleImageList = @"image_list";

@implementation WOOArticleModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kWOOArticleAbstract] isKindOfClass:[NSNull class]]){
        self.abstract = dictionary[kWOOArticleAbstract];
    }
    
    if(![dictionary[kWOOArticleTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kWOOArticleTitle];
    }
    
    if(![dictionary[kWOOArticleHasVideo] isKindOfClass:[NSNull class]]){
        self.has_video = [dictionary[kWOOArticleHasVideo] boolValue];
    }
    if(![dictionary[kWOOArticleDisplayUrl] isKindOfClass:[NSNull class]]){
        self.display_url = dictionary[kWOOArticleDisplayUrl];
    }
    if(![dictionary[kWOOArticleGroupId] isKindOfClass:[NSNull class]]){
        self.group_id = dictionary[kWOOArticleGroupId];
    }
    if(![dictionary[kWOOArticleSource] isKindOfClass:[NSNull class]]){
        self.source = dictionary[kWOOArticleSource];
    }
    if(![dictionary[kWOOArticleVideoId] isKindOfClass:[NSNull class]]){
        self.video_id = dictionary[kWOOArticleVideoId];
    }

    if(![dictionary[kWOOArticleSource] isKindOfClass:[NSNull class]]){
        self.source = dictionary[kWOOArticleSource];
    }
    
    if(![dictionary[kWOOArticleMiddleImage] isKindOfClass:[NSNull class]]){
        self.middle_image = dictionary[kWOOArticleMiddleImage];
    }
    if(![dictionary[kWOOArticleImageList] isKindOfClass:[NSNull class]] && [dictionary[kWOOArticleImageList] isKindOfClass:[NSArray class]]){
        self.image_list = dictionary[kWOOArticleImageList];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.abstract != nil){
        dictionary[kWOOArticleAbstract] = self.abstract;
    }
    if(self.title != nil){
        dictionary[kWOOArticleTitle] = self.title;
    }
    dictionary[kWOOArticleHasVideo] = @(self.has_video);
    if(self.display_url != nil){
        dictionary[kWOOArticleDisplayUrl] = self.display_url;
    }
    if(self.group_id != nil){
        dictionary[kWOOArticleGroupId] = self.group_id;
    }
    if (self.video_id != nil) {
        dictionary[kWOOArticleVideoId] = self.video_id;
    }
    if(self.source != nil){
        dictionary[kWOOArticleSource] = self.source;
    }
    if(self.middle_image != nil){
        dictionary[kWOOArticleMiddleImage] = self.middle_image;
    }
    if(self.image_list != nil){
        dictionary[kWOOArticleImageList] = self.image_list;
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
    if(self.abstract != nil){
        [aCoder encodeObject:self.abstract forKey:kWOOArticleAbstract];
    }
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kWOOArticleTitle];
    }
    [aCoder encodeObject:@(self.has_video) forKey:kWOOArticleHasVideo];
    if(self.display_url != nil){
        [aCoder encodeObject:self.display_url forKey:kWOOArticleDisplayUrl];
    }
    if(self.group_id != nil){
        [aCoder encodeObject:self.group_id forKey:kWOOArticleGroupId];
    }
    if(self.source != nil){
        [aCoder encodeObject:self.source forKey:kWOOArticleSource];
    }
    if(self.middle_image != nil){
        [aCoder encodeObject:self.middle_image forKey:kWOOArticleMiddleImage];
    }
    if(self.image_list != nil){
        [aCoder encodeObject:self.image_list forKey:kWOOArticleImageList];
    }
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.abstract = [aDecoder decodeObjectForKey:kWOOArticleAbstract];
    self.title = [aDecoder decodeObjectForKey:kWOOArticleTitle];
    self.has_video = [[aDecoder decodeObjectForKey:kWOOArticleHasVideo] boolValue];
    self.display_url = [aDecoder decodeObjectForKey:kWOOArticleDisplayUrl];
    self.group_id = [aDecoder decodeObjectForKey:kWOOArticleGroupId];
    self.source = [aDecoder decodeObjectForKey:kWOOArticleSource];
    self.middle_image = [aDecoder decodeObjectForKey:kWOOArticleMiddleImage];
    self.image_list = [aDecoder decodeObjectForKey:kWOOArticleImageList];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    WOOArticleModel *copy = [WOOArticleModel new];
    
    copy.abstract = [self.abstract copy];
    copy.title = [self.title copy];
    copy.has_video = self.has_video;
    copy.display_url = [self.display_url copy];
    copy.group_id = [self.group_id copy];
    copy.source = [self.source copy];
    copy.middle_image = [self.middle_image copy];
    copy.image_list = [self.image_list copy];    
    return copy;
}

@end

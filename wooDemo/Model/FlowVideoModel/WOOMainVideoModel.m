//
//  WOOMainVideoModel.m
//  wooDemo
//
//  Created by colr on 2018/11/22.
//  Copyright © 2018 colr. All rights reserved.
//


NSString *const KWOOMainVideoModelStatus = @"status";
NSString *const KWOOMainVideoModelUserId = @"user_id";
NSString *const KWOOMainVideoModelVideoId = @"video_id";
NSString *const KWOOMainVideoModelValidate = @"validate";
NSString *const KWOOMainVideoModelEnableSsl = @"enable_ssl";
NSString *const KWOOMainVideoModelPosterUrl = @"poster_url";
NSString *const KWOOMainVideoModelVideoDuration = @"video_duration";
NSString *const KWOOMainVideoModelMediaType = @"media_type";
NSString *const KWOOMainVideoModelAutoDefinition = @"auto_definition";
NSString *const KWOOMainVideoModelVideoList = @"video_list";
NSString *const KWOOMainVideoModelDynamicVideo = @"dynamic_video";


#import "WOOMainVideoModel.h"
#import "WOOVideoModel.h"

@implementation WOOMainVideoModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (dictionary[KWOOMainVideoModelVideoList] != nil && [dictionary[KWOOMainVideoModelVideoList] isKindOfClass:[NSDictionary class]]) {
        NSDictionary * videoDictionary = dictionary[KWOOMainVideoModelVideoList];
        NSMutableArray *videoItems = [NSMutableArray array];
        NSArray * keyArr = [videoDictionary allKeys];
        for (NSString * key in keyArr) {
            NSDictionary * dic = [videoDictionary objectForKey:key];
            WOOVideoModel * video = [[WOOVideoModel alloc]initWithDictionary:dic];
            [videoItems addObject:video];
        }
        self.video_list = videoItems;
    }
    if (![dictionary[KWOOMainVideoModelStatus] isKindOfClass:[NSNull class]]) {
        self.status = [dictionary[KWOOMainVideoModelStatus] integerValue];
    }

    if (![dictionary[KWOOMainVideoModelUserId] isKindOfClass:[NSNull class]]) {
        self.user_id = dictionary[KWOOMainVideoModelUserId];
    }

    if (![dictionary[KWOOMainVideoModelVideoId] isKindOfClass:[NSNull class]]) {
        self.video_id = dictionary[KWOOMainVideoModelVideoId];
    }

    if (![dictionary[KWOOMainVideoModelValidate] isKindOfClass:[NSNull class]]) {
        self.validate = dictionary[KWOOMainVideoModelValidate];
    }

    if (![dictionary[KWOOMainVideoModelEnableSsl] isKindOfClass:[NSNull class]]) {
        self.enable_ssl = [dictionary[KWOOMainVideoModelEnableSsl] boolValue];
    }

    if (![dictionary[KWOOMainVideoModelPosterUrl] isKindOfClass:[NSNull class]]) {
        self.poster_url = dictionary[KWOOMainVideoModelPosterUrl];
    }

    if (![dictionary[KWOOMainVideoModelVideoDuration] isKindOfClass:[NSNull class]]) {
        self.video_duration = [dictionary[KWOOMainVideoModelVideoDuration] integerValue];
    }
    
    if (![dictionary[KWOOMainVideoModelMediaType] isKindOfClass:[NSNull class]]) {
        self.media_type = dictionary[KWOOMainVideoModelMediaType];
    }
    
    if (![dictionary[KWOOMainVideoModelAutoDefinition] isKindOfClass:[NSNull class]]) {
        self.auto_definition = dictionary[KWOOMainVideoModelAutoDefinition];
    }
    
    if (![dictionary[KWOOMainVideoModelDynamicVideo] isKindOfClass:[NSNull class]]) {
        self.dynamic_video = dictionary[KWOOMainVideoModelDynamicVideo];
    }
    
    return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if (self.video_list != nil) {
        NSMutableArray * itemArr = [NSMutableArray array];
        for (WOOVideoModel * model in self.video_list) {
            NSDictionary * dic = [model toDictionary];
            [itemArr addObject:dic];
        }
        dictionary[KWOOMainVideoModelVideoList] = itemArr;
    }
    
    dictionary[KWOOMainVideoModelStatus] = @(self.status);
    dictionary[KWOOMainVideoModelUserId]  = self.user_id;
    dictionary[KWOOMainVideoModelVideoId] = self.video_id;
    dictionary[KWOOMainVideoModelValidate] = self.validate;
    dictionary[KWOOMainVideoModelVideoDuration] = @(self.video_duration);
    dictionary[KWOOMainVideoModelEnableSsl] = @(self.enable_ssl);
    dictionary[KWOOMainVideoModelPosterUrl] = self.poster_url;
    dictionary[KWOOMainVideoModelMediaType] = self.media_type;
    dictionary[KWOOMainVideoModelAutoDefinition] = self.auto_definition;
    dictionary[KWOOMainVideoModelDynamicVideo] = self.dynamic_video;
    return dictionary;
}

@end

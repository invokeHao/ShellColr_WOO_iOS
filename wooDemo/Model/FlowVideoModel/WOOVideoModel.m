//
//  WOOVideoModel.m
//  wooDemo
//
//  Created by colr on 2018/11/22.
//  Copyright © 2018 colr. All rights reserved.
//

NSString *const KWOOVideoModelDefinition = @"definition";
NSString *const KWOOVideoModelVtype = @"vtype";
NSString *const KWOOVideoModelVwidth = @"vwidth";
NSString *const KWOOVideoModelVheight = @"vheight";
NSString *const KWOOVideoModelBitrate = @"bitrate";
NSString *const KWOOVideoModelSize = @"size";
NSString *const KWOOVideoModelQuality = @"quality";
NSString *const KWOOVideoModelCodecType = @"codec_type";
NSString *const KWOOVideoModelLogoType = @"logo_type";
NSString *const KWOOVideoModelEncrypt = @"encrypt";
NSString *const KWOOVideoModelFileHash = @"file_hash";
NSString *const KWOOVideoModelMainUrl = @"main_url";
NSString *const KWOOVideoModelBackupUrl1 = @"backup_url_1";
NSString *const KWOOVideoModelUserVideoProxy = @"user_video_proxy";
NSString *const KWOOVideoModelSocketBuffer = @"socket_buffer";
NSString *const KWOOVideoModelPreloadSize = @"preload_size";
NSString *const KWOOVideoModelPreloadInterval = @"preload_interval";
NSString *const KWOOVideoModelPreloadMinStep = @"preload_min_step";
NSString *const KWOOVideoModelPreloadMaxStep = @"preload_max_step";
NSString *const KWOOVideoModelSpadeA = @"spade_a";

#import "WOOVideoModel.h"

@implementation WOOVideoModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (![dictionary[KWOOVideoModelDefinition] isKindOfClass:[NSNull class]]) {
        self.definition = dictionary[KWOOVideoModelDefinition];
    }
    if (![dictionary[KWOOVideoModelVtype] isKindOfClass:[NSNull class]]) {
        self.vtype = dictionary[KWOOVideoModelVtype];
    }
    if (![dictionary[KWOOVideoModelVwidth] isKindOfClass:[NSNull class]]) {
        self.vwidth = [dictionary[KWOOVideoModelVwidth] integerValue];
    }
    if (![dictionary[KWOOVideoModelVheight] isKindOfClass:[NSNull class]]) {
        self.vheight = [dictionary[KWOOVideoModelVheight] integerValue];
    }
    if (![dictionary[KWOOVideoModelBitrate] isKindOfClass:[NSNull class]]) {
        self.bitrate = [dictionary[KWOOVideoModelBitrate] integerValue];
    }
    if (![dictionary[KWOOVideoModelSize] isKindOfClass:[NSNull class]]) {
        self.size = [dictionary[KWOOVideoModelSize] integerValue];
    }
    if (![dictionary[KWOOVideoModelQuality] isKindOfClass:[NSNull class]]) {
        self.quality = dictionary[KWOOVideoModelQuality];
    }
    if (![dictionary[KWOOVideoModelCodecType] isKindOfClass:[NSNull class]]) {
        self.codec_type = dictionary[KWOOVideoModelCodecType];
    }
    if (![dictionary[KWOOVideoModelLogoType] isKindOfClass:[NSNull class]]) {
        self.logo_type = dictionary[KWOOVideoModelLogoType];
    }
    if (![dictionary[KWOOVideoModelEncrypt] isKindOfClass:[NSNull class]]) {
        self.encrypt = [dictionary[KWOOVideoModelEncrypt] boolValue];
    }
    if (![dictionary[KWOOVideoModelFileHash] isKindOfClass:[NSNull class]]) {
        self.file_hash = dictionary[KWOOVideoModelFileHash];
    }
    if (![dictionary[KWOOVideoModelMainUrl] isKindOfClass:[NSNull class]]) {
        NSString * base64String = dictionary[KWOOVideoModelMainUrl];
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
        NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
        
        self.main_url = decodedString;
    }
    if (![dictionary[KWOOVideoModelBackupUrl1] isKindOfClass:[NSNull class]]) {
        NSString * base64String = dictionary[KWOOVideoModelBackupUrl1];
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
        NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
        self.backup_url_1 = decodedString;
    }
    if (![dictionary[KWOOVideoModelUserVideoProxy] isKindOfClass:[NSNull class]]) {
        self.user_video_proxy = [dictionary[KWOOVideoModelUserVideoProxy] integerValue];
    }
    if (![dictionary[KWOOVideoModelSocketBuffer] isKindOfClass:[NSNull class]]) {
        self.socket_buffer = [dictionary[KWOOVideoModelSocketBuffer] integerValue];
    }
    if (![dictionary[KWOOVideoModelPreloadSize] isKindOfClass:[NSNull class]]) {
        self.preload_size = [dictionary[KWOOVideoModelPreloadSize] integerValue];
    }
    if (![dictionary[KWOOVideoModelPreloadMinStep] isKindOfClass:[NSNull class]]) {
        self.preload_min_step = [dictionary[KWOOVideoModelPreloadMinStep] integerValue];
    }
    if (![dictionary[KWOOVideoModelPreloadMaxStep] isKindOfClass:[NSNull class]]) {
        self.preload_max_step = [dictionary[KWOOVideoModelPreloadMaxStep] integerValue];
    }
    if (![dictionary[KWOOVideoModelPreloadInterval] isKindOfClass:[NSNull class]]) {
        self.preload_interval = [dictionary[KWOOVideoModelPreloadInterval] integerValue];
    }
    if (![dictionary[KWOOVideoModelSpadeA] isKindOfClass:[NSNull class]]) {
        self.spade_a = dictionary[KWOOVideoModelSpadeA];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[KWOOVideoModelDefinition] = self.definition;
    dictionary[KWOOVideoModelVtype]  = self.vtype;
    dictionary[KWOOVideoModelVwidth] = @(self.vheight);
    dictionary[KWOOVideoModelVheight] = @(self.vheight);
    dictionary[KWOOVideoModelBitrate] = @(self.bitrate);
    dictionary[KWOOVideoModelSize] = @(self.size);
    dictionary[KWOOVideoModelQuality] = self.quality;
    dictionary[KWOOVideoModelCodecType] = self.codec_type;
    dictionary[KWOOVideoModelLogoType] = self.logo_type;
    dictionary[KWOOVideoModelEncrypt] = @(self.encrypt);
    dictionary[KWOOVideoModelFileHash] = self.file_hash;
    dictionary[KWOOVideoModelMainUrl] = self.main_url;
    dictionary[KWOOVideoModelBackupUrl1] = self.backup_url_1;
    dictionary[KWOOVideoModelUserVideoProxy] = @(self.user_video_proxy);
    dictionary[KWOOVideoModelSocketBuffer] = @(self.socket_buffer);
    dictionary[KWOOVideoModelPreloadSize] = @(self.preload_size);
    dictionary[KWOOVideoModelPreloadMinStep] = @(self.preload_min_step);
    dictionary[KWOOVideoModelPreloadMaxStep] = @(self.preload_max_step);
    dictionary[KWOOVideoModelPreloadInterval] = @(self.preload_interval);
    dictionary[KWOOVideoModelSpadeA] = self.spade_a;
    return dictionary;
}

@end

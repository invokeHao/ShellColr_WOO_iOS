//
//  WOOVideoModel.h
//  wooDemo
//
//  Created by colr on 2018/11/22.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOVideoModel : WOOBaseModel

@property (nonatomic, strong)NSString * definition;
@property (nonatomic, strong)NSString * vtype;
@property (nonatomic, assign)NSInteger vwidth;
@property (nonatomic, assign)NSInteger vheight;
@property (nonatomic, assign)NSInteger bitrate;
@property (nonatomic, assign)NSInteger size;
@property (nonatomic, strong)NSString * quality;
@property (nonatomic, strong)NSString * codec_type;
@property (nonatomic, strong)NSString * logo_type;
@property (nonatomic, assign)BOOL encrypt;
@property (nonatomic, strong)NSString * file_hash;
@property (nonatomic, strong)NSString * main_url;
@property (nonatomic, strong)NSString * backup_url_1;
@property (nonatomic, assign)NSInteger user_video_proxy;
@property (nonatomic, assign)NSInteger socket_buffer;
@property (nonatomic, assign)NSInteger preload_size;
@property (nonatomic, assign)NSInteger preload_interval;
@property (nonatomic, assign)NSInteger preload_min_step;
@property (nonatomic, assign)NSInteger preload_max_step;
@property (nonatomic, strong)NSString * spade_a;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END

//
//  WOOMainVideoModel.h
//  wooDemo
//
//  Created by colr on 2018/11/22.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOMainVideoModel : WOOBaseModel

@property (nonatomic, assign)NSInteger status;
@property (nonatomic, strong)NSString * user_id;
@property (nonatomic, strong)NSString * video_id;
@property (nonatomic, strong)NSString * validate;
@property (nonatomic, assign)BOOL enable_ssl;
@property (nonatomic, strong)NSString * poster_url;
@property (nonatomic, assign)NSInteger video_duration;
@property (nonatomic, strong)NSString * media_type;
@property (nonatomic, strong)NSString * auto_definition;
@property (nonatomic, strong)NSArray * video_list;
@property (nonatomic, strong)NSString * dynamic_video;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

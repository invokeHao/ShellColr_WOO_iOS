//
//  WOOTipsModel.h
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOTipsModel : WOOBaseModel

@property (nonatomic, strong)NSString* type;

@property (nonatomic, assign)NSInteger display_duration;

@property (nonatomic, strong)NSString* display_info;

@property (nonatomic, strong)NSString* display_template;

@property (nonatomic, strong)NSString* open_url;

@property (nonatomic, strong)NSString* web_url;

@property (nonatomic, strong)NSString* download_url;

@property (nonatomic, strong)NSString* app_name;

@property (nonatomic, strong)NSString* package_name;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

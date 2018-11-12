//
//  WOOArticleModel.h
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOArticleModel : WOOBaseModel

@property (nonatomic, copy) NSString* abstract;

@property (nonatomic, copy) NSString* title;

@property (nonatomic, assign) BOOL has_video;

@property (nonatomic, copy) NSString* display_url;

@property (nonatomic, copy) NSString* group_id;

@property (nonatomic, copy) NSString* video_id;

@property (nonatomic, copy) NSString* source;

@property (nonatomic, copy) NSString* middle_image;

@property (nonatomic, strong)NSArray * image_list;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

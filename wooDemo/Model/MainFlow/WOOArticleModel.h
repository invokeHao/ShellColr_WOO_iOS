//
//  WOOArticleModel.h
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

typedef NS_ENUM(NSUInteger, WOOArticleModelType) {
    WOOArticleModelTopSamllType,
    WOOArticleModelHotVideoType,
    WOOArticleModelBottomImagesType,
    WOOArticleModelBottomTextOnlyType,
    WOOArticleModelUnknowType
};

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

//业务字段

@property (nonatomic, assign)WOOArticleModelType modelType;

@property (nonatomic, assign)BOOL isBigCell; //Ins的大cell

@property (nonatomic, assign)BOOL isTopSamCell;

@property (nonatomic, assign)BOOL isHotVideo;//热门视频

@property (nonatomic, assign)BOOL isTextOnly; //纯文本

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

- (NSDictionary *)toDictionary;

//bottomSC专用
- (CGFloat)bottomImageListSCHeight;

- (CGFloat)bottomTextOnlySCHeight;

@end

NS_ASSUME_NONNULL_END

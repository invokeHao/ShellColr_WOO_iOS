//
//  WOOMainFlowModel.h
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"
#import "WOOTipsModel.h"
#import "WOOArticleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOMainFlowModel : WOOBaseModel

@property (nonatomic, strong)NSArray <WOOArticleModel *>* articleArray;

@property (nonatomic, assign)NSInteger total_number;

@property (nonatomic, assign)BOOL has_more;

@property (nonatomic, assign)NSInteger login_status;

@property (nonatomic, assign)NSInteger show_et_status;

@property (nonatomic, strong)NSString* post_content_hint;

@property (nonatomic, assign)BOOL has_more_to_refresh;

@property (nonatomic, assign)NSInteger action_to_last_stick;

@property (nonatomic, assign)NSInteger feed_flag;

//tips 对象

@property (nonatomic, strong)WOOTipsModel * tips;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

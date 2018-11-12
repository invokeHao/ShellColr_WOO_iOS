//
//  WOOApiHostModel.h
//  wooDemo
//
//  Created by colr on 2018/11/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOApiHostModel : WOOBaseModel

@property (nonatomic, assign)NSInteger error_interval;

@property (nonatomic, strong)NSString *pattern;

@property (nonatomic, assign)NSInteger sample_ratio;

@property (nonatomic, assign)NSInteger report_server_error;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END

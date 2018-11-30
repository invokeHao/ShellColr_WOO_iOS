//
//  WOOUserDeviceModel.h
//  wooDemo
//
//  Created by colr on 2018/10/31.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOUserDeviceModel : WOOBaseModel

@property (nonatomic, copy)NSString * resolution;//屏幕分辨率
@property (nonatomic, copy)NSString * display_density;//屏幕密度
@property (nonatomic, copy)NSString * carrier; //移动网络属性
@property (nonatomic, copy)NSString * os; //操作系统
@property (nonatomic, copy)NSString * os_version; //操作系统版本
@property (nonatomic, copy)NSString * mc; //MAC地址
@property (nonatomic, copy)NSString * device_brand;//手机厂商
@property (nonatomic, copy)NSString * device_model;//手机型号
@property (nonatomic, copy)NSString * rom; //ROM
@property (nonatomic, copy)NSString * os_api; //API
@property (nonatomic, copy)NSString * timezone; //时区
@property (nonatomic, copy)NSString * language; //语言
@property (nonatomic, copy)NSString * uuid; //UUID
@property (nonatomic, copy)NSString * sig_hash; //上面所有数据的hash加密
@property (nonatomic, copy)NSString * Openuuid;

@property (nonatomic, copy)NSString * app_name;
@property (nonatomic, copy)NSString * version_code;
@property (nonatomic, copy)NSString * device_id;


- (NSDictionary *)toDictionary;

- (NSDictionary *)streamListDictionary;

@end

NS_ASSUME_NONNULL_END

//
//  WOOThirdAuthResponse.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOThirdAuthResponse : WOOBaseModel

- (instancetype)initWithOpenId:(NSString *)openid
                          code:(NSString *)code
                          avti:(NSInteger)avti;

@property (nonatomic, strong) NSString *openid;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) NSInteger avti;


@end

NS_ASSUME_NONNULL_END

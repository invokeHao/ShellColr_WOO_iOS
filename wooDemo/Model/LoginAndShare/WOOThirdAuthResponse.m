//
//  WOOThirdAuthResponse.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOThirdAuthResponse.h"

@implementation WOOThirdAuthResponse

- (instancetype)initWithOpenId:(NSString *)openid code:(NSString *)code avti:(NSInteger)avti {
    self = [super init];
    if (self) {
        _openid = openid;
        _code = code;
        _avti = avti;
    }
    return self;
}

@end

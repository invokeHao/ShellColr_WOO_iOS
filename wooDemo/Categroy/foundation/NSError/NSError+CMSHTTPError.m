//
//  NSError+CMSHTTPError.m
//  cosmos
//
//  Created by Lane on 2018/4/2.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "NSError+CMSHTTPError.h"

NSString *CMSErrorDesc = @"desc";
NSString *CMSDomain = @"com.shellcolr.cosmos";
NSString *NSErrorDesc = @"NSLocalizedDescription";

@implementation NSError (CMSHTTPError)

+ (instancetype)errorWithCode:(NSInteger)code userInfo:(NSDictionary<NSErrorUserInfoKey,id> *)userInfo {
    NSError *error = [NSError errorWithDomain:CMSDomain
                                         code:code
                                     userInfo:userInfo];
    return error;
}

+ (instancetype)errorWithCode:(NSInteger)code desc:(NSString *)desc {
    NSError *error = [NSError errorWithDomain:CMSDomain
                                         code:code
                                     userInfo:@{CMSErrorDesc: desc ? desc : @"no desc"}];
    return error;
}

- (NSString *)descriptionFromServer {
    NSString *descriptionString = [self.userInfo valueForKey:CMSErrorDesc];
    if (!descriptionString || [descriptionString isEqualToString:@""]) {
        if ([self.userInfo valueForKey:NSErrorDesc]) {
            descriptionString = [self.userInfo valueForKey:NSErrorDesc];
        }else{
            descriptionString = @"服务异常，请稍后再试";
        }
    }
    return descriptionString;
}

@end

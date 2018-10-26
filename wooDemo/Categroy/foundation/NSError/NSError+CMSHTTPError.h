//
//  NSError+CMSHTTPError.h
//  cosmos
//
//  Created by Lane on 2018/4/2.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (CMSHTTPError)

+ (instancetype)errorWithCode:(NSInteger)code userInfo:(NSDictionary<NSErrorUserInfoKey, id> *)userInfo;

+ (instancetype)errorWithCode:(NSInteger)code desc:(NSString *)desc;

- (NSString *)descriptionFromServer;

@end

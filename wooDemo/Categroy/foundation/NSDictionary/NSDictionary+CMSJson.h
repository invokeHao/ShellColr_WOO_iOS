//
//  NSDictionary+CMSJson.h
//  cosmos
//
//  Created by Lane on 2018/4/10.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CMSJson)

- (NSString *)jsonString: (NSString *)key;

- (NSDictionary *)jsonDict: (NSString *)key;
- (NSArray *)jsonArray: (NSString *)key;
- (NSArray *)jsonStringArray: (NSString *)key;


- (BOOL)jsonBool: (NSString *)key;
- (NSInteger)jsonInteger: (NSString *)key;
- (long long)jsonLongLong: (NSString *)key;
- (unsigned long long)jsonUnsignedLongLong:(NSString *)key;

- (double)jsonDouble: (NSString *)key;

@end

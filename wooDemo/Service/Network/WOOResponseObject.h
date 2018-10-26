//
//  WOOResponseObject.h
//  cosmos
//
//  Created by 周凌宇 on 2018/4/13.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WOOResponseObject : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString * errorDesc;
@property (nonatomic, assign) NSInteger errorId;
@property (nonatomic, strong) id result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end

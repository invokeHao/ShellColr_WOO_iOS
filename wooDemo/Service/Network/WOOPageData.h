//
//  WOOPageRange.h
//  cosmos
//
//  Created by 周凌宇 on 2018/4/13.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WOOPageRange : NSObject

@property (nonatomic, assign) NSInteger endRowIdx;
@property (nonatomic, assign) NSInteger startRowIdx;
@property (nonatomic, assign) NSInteger totalRows;

@property (nonatomic, assign) NSInteger countPerPage;
@property (nonatomic, assign) NSInteger page;

@end

@interface WOOPageData : NSObject

@property (nonatomic, strong) WOOPageRange * range;
@property (nonatomic, strong) NSArray * rows;

@end

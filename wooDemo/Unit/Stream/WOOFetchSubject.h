//
//  WOOFetchSubject.h
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOOFetchSubject : NSObject

- (void)sendNext:(id)value;
- (void)sendError:(NSError *)error;

- (void)subscribeNext:(void (^)(id x))nextBlock;

- (void)subscribeNext:(void (^)(id x))nextBlock
                error:(void (^)(NSError *error))errorBlock;


@end

NS_ASSUME_NONNULL_END

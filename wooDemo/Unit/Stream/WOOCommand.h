//
//  WOOCommand.h
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WOOCommand;
NS_ASSUME_NONNULL_BEGIN

typedef void(^WOOCommandLoadingBlock)(BOOL loading);
typedef void(^WOOCommandErrorBlock)(NSError *error);
typedef void(^WOOCommandCompleteBlock)(id result);

@protocol WOOCommandDataSoure <NSObject>

- (void)command:(WOOCommand *)command withSubscriber:(id<RACSubscriber>)subscriber andInput:(id)input;

@end

@interface WOOCommand : NSObject

@property (nonatomic, weak) id<WOOCommandDataSoure> dataSoure;

- (void)execute:(nullable id)input;

- (void)subscribeLoading:(WOOCommandLoadingBlock)loadingBlock
                   error:(WOOCommandErrorBlock)errorBlock
               completed:(WOOCommandCompleteBlock)completedBlock;

- (void)subscribeError:(WOOCommandErrorBlock)errorBlock
             completed:(WOOCommandCompleteBlock)completedBlock;

- (void)subscribeCompleted:(WOOCommandCompleteBlock)completedBlock;

@end

NS_ASSUME_NONNULL_END

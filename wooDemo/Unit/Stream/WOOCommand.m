//
//  WOOCommand.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOCommand.h"

@interface WOOCommand()

@property (nonatomic, strong) RACCommand *command;

@end

@implementation WOOCommand

- (void)execute:(id)input {
    [self.command execute:input];
}

- (void)subscribeLoading:(WOOCommandLoadingBlock)loadingBlock
                   error:(WOOCommandErrorBlock)errorBlock
               completed:(WOOCommandCompleteBlock)completedBlock {
    [self.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        if (completedBlock) {
            completedBlock(x);
        }
    }];
    [[self.command.errors throttle:0.2] subscribeNext:^(id x) {
        if ([x isKindOfClass:[NSError class]]) {
            if (errorBlock) {
                errorBlock(x);
            }
        }
    }];
    [[self.command.executing skip:1] subscribeNext:^(id x) {
        if (loadingBlock) {
            loadingBlock([x boolValue]);
        }
    }];
}

- (void)subscribeError:(WOOCommandErrorBlock)errorBlock
             completed:(WOOCommandCompleteBlock)completedBlock {
    [self.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        if (completedBlock) {
            completedBlock(x);
        }
    }];
    [[self.command.errors throttle:0.2] subscribeNext:^(id x) {
        if ([x isKindOfClass:[NSError class]]) {
            if (errorBlock) {
                errorBlock(x);
            }
        }
    }];
}

- (void)subscribeCompleted:(WOOCommandCompleteBlock)completedBlock {
    [self.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        if (completedBlock) {
            completedBlock(x);
        }
    }];
}

- (RACCommand *)command {
    if (!_command) {
        @weakify(self);
        _command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id x) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                if (self.dataSoure && [self.dataSoure respondsToSelector:@selector(command:withSubscriber:andInput:)]) {
                    [self.dataSoure command:self withSubscriber:subscriber andInput:x];
                }
                return nil;
            }];
        }];
    }
    return _command;
}


@end

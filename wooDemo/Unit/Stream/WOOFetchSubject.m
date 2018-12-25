//
//  WOOFetchSubject.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOFetchSubject.h"

@interface WOOFetchSubject()

@property (nonatomic, strong) RACSubject *loadNextSubject;
@property (nonatomic, strong) RACSubject *errorSubject;

@end

@implementation WOOFetchSubject

- (void)sendNext:(id)value {
    [self.loadNextSubject sendNext:value];
}

- (void)sendError:(NSError *)error {
    [self.errorSubject sendNext:error];
}

- (void)subscribeNext:(void (^)(id x))nextBlock {
    [self.loadNextSubject subscribeNext:nextBlock];
}

- (void)subscribeNext:(void (^)(id x))nextBlock
                error:(void (^)(NSError *error))errorBlock {
    [self.loadNextSubject subscribeNext:nextBlock];
    [self.errorSubject subscribeNext:errorBlock];
}


#pragma mark - getting

- (RACSubject *)loadNextSubject {
    if (!_loadNextSubject) {
        _loadNextSubject = [RACSubject subject];
    }
    return _loadNextSubject;
}

- (RACSubject *)errorSubject {
    if (!_errorSubject) {
        _errorSubject = [RACSubject subject];
    }
    return _errorSubject;
}


@end

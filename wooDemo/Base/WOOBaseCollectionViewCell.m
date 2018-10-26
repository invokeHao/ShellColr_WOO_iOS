//
//  WOOBaseCollectionViewCell.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseCollectionViewCell.h"

@implementation WOOBaseCollectionViewCell

- (void)renderWithModel:(id)element args:(NSDictionary *)args {
    self.element = element;
    NSAssert(NO, @"重写me");
}

+ (CGSize)cellSizeWithModel:(id)element args:(NSDictionary *)args {
    NSAssert(NO, @"重写me");
    return CGSizeMake(44, 44);
}

+ (NSString *)reuseID {
    return NSStringFromClass([self class]);
}

+ (NSString *)identifer {
    return NSStringFromClass([self class]);
}


@end

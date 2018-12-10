//
//  WOOBaseTableViewCell.m
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseTableViewCell.h"

@implementation WOOBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
}

- (void)renderWithModel:(id)element args:(NSDictionary *)args {
    self.element = element;
    NSAssert(NO, @"重写me");
}

+ (CGFloat)cellHeightWithModel:(id)element args:(NSDictionary *)args {
    NSAssert(NO, @"重写me");
    return 44;
}

+ (NSString *)reuseID {
    return NSStringFromClass([self class]);
}

@end

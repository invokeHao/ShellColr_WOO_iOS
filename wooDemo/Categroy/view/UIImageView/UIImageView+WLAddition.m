//
//  UIImageView+WLAddition.m
//  cosmos
//
//  Created by Lane on 2018/4/23.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UIImageView+WLAddition.h"

@implementation UIImageView (WLAddition)

+ (UIImageView *)imageName:(NSString *)imageName contentMode:(UIViewContentMode)mode {
    UIImageView *imageView = nil;
    if (imageName && ![imageName isEqualToString:@""]) {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    } else {
        imageView = [[UIImageView alloc] init];
    }
    imageView.contentMode = mode;
    return imageView;
}

@end

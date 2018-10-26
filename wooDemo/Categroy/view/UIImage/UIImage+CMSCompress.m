
//
//  UIImage+CMSCompress.m
//  cosmos
//
//  Created by Lane on 2018/5/21.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "UIImage+CMSCompress.h"

@implementation UIImage (CMSCompress)

- (UIImage *)scaledToMaxSide:(CGFloat)maxSide {
    if (!self) {
        return nil;
    }
    CGSize oldSize = self.size;
    if (oldSize.width < maxSide && oldSize.height < maxSide) {
        return self;
    }
    
    CGFloat rate = oldSize.width / oldSize.height;
    CGSize targetSize;
    if (rate > 1.0) {
        targetSize = CGSizeMake(maxSide, maxSide * oldSize.height / oldSize.width);
    } else {
        targetSize = CGSizeMake(maxSide * oldSize.width / oldSize.height, maxSide);
    }
    
    UIGraphicsBeginImageContext(targetSize);
    [self drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (NSData *)compressToByte:(NSUInteger)maxLength {
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    if (data.length < maxLength) {
        return data;
    }
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    return data;
}

- (NSData *)uploadImageCompress {
     return [[self scaledToMaxSide:1280] compressToByte:1024 * 1024];
}

@end

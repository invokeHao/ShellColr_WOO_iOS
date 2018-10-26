//
//  UIImage+CMSCompress.h
//  cosmos
//
//  Created by Lane on 2018/5/21.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CMSCompress)

// 压缩分辨率
- (UIImage *)scaledToMaxSide:(CGFloat)maxSide;

// 压缩质量
- (NSData *)compressToByte:(NSUInteger)maxLength;

// mobu上传图片压缩
- (NSData *)uploadImageCompress;

@end

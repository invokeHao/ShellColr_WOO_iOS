//
//  WOOBaseCollectionViewCell.h
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOOBaseCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) id element;

- (void)renderWithModel:(id)element args:(NSDictionary *)args;

+ (CGSize)cellSizeWithModel:(id)element args:(NSDictionary *)args;

- (void)setupViews;

+ (NSString *)reuseID;

+ (NSString *)identifer;

@end

NS_ASSUME_NONNULL_END

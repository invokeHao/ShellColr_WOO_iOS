//
//  WOOBaseTableViewCell.h
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOOBaseTableViewCell : UITableViewCell
@property (strong, nonatomic) id element;

- (void)setupViews;

+ (NSString *)reuseID;
@end

NS_ASSUME_NONNULL_END

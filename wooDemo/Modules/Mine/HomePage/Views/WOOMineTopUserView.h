//
//  WOOMineTopUserView.h
//  wooDemo
//
//  Created by colr on 2018/12/11.
//  Copyright © 2018 colr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WOOProfile.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOMineTopUserView : UIView

@property (nonatomic, strong)WOOProfile * model;

@property (strong, nonatomic)RACSubject * loginSubject;

@end

NS_ASSUME_NONNULL_END

//
//  WOOMineHomePageVM.h
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOMineBasicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOMineHomePageVM : NSObject

@property (strong, nonatomic, readonly)NSArray<WOOMineBasicModel*> * dataList;

@property (strong, nonatomic, readonly)WOOLoginModel * userModel;

- (void)refreshTheUserInfo;

@end

NS_ASSUME_NONNULL_END

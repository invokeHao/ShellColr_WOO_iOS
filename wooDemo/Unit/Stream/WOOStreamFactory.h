//
//  WOOStreamFactory.h
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WOOCommand.h"
#import "WOOFetchSubject.h"

NS_ASSUME_NONNULL_BEGIN

@interface WOOStreamFactory : NSObject

+ (WOOFetchSubject *)exportFetchSubject;
+ (WOOCommand *)exportCommand;

@end

NS_ASSUME_NONNULL_END

//
//  WOOStreamFactory.m
//  wooDemo
//
//  Created by colr on 2018/12/12.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOStreamFactory.h"

@implementation WOOStreamFactory

+ (WOOFetchSubject *)exportFetchSubject {
    return [[WOOFetchSubject alloc] init];
}

+ (WOOCommand *)exportCommand {
    return [[WOOCommand alloc] init];
}


@end

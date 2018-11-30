//
//  WOOFlowDetailVC.h
//  wooDemo
//
//  Created by colr on 2018/11/20.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOBaseViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOOFlowDetailVC : WOOBaseViewController

@property (nonatomic, copy) NSString * itemId;

@property (nonatomic, copy) NSString * videoId;

@property (nonatomic, strong) WKWebView *webView;

@end

NS_ASSUME_NONNULL_END

//
//  WOOMacro.h
//  wooDemo
//
//  Created by colr on 2018/10/25.
//  Copyright © 2018 colr. All rights reserved.
//

#ifndef WOOMacro_h
#define WOOMacro_h

#define VERTICAL_SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define VERTICAL_SCREEN_WIDTH  MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define WINTH_SCALE VERTICAL_SCREEN_WIDTH / 414.0
#define HEIGHT_SCALE VERTICAL_SCREEN_HEIGHT / 736.0
#define W_SCALE(r) (WINTH_SCALE * r)
#define H_SCALE(r) (HEIGHT_SCALE * r)
#define SCREEN_SCALE [UIScreen mainScreen].scale

#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

/**
 * 在iPhoneX上屏幕之外的inset{44, 0, 34, 0}
 */
#define UIVIEW_SAFEAREA_INSET \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wpartial-availability\"") \
([UIDevice currentDevice].systemVersion.floatValue >= 11.0 \
? (UIApplication.sharedApplication.keyWindow.safeAreaInsets) \
: UIEdgeInsetsZero) \
_Pragma("clang diagnostic pop")

// GCD related
#define woo_dispatch_time(seconds) dispatch_time(DISPATCH_TIME_NOW, (int64_t)((seconds) * NSEC_PER_SEC))

#define woo_dispatch_after(seconds, block) do { \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((seconds) * NSEC_PER_SEC)), dispatch_get_main_queue(), block);\
} while(0)

#define woo_dispatch_main_async(block) do { \
dispatch_async(dispatch_get_main_queue(), block); \
} while(0)

#define woo_dispath_background_async(block) do { \
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block); \
} while(0)

// 判断是否是iPhone X
//#define IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONEX [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0
// 状态栏高度
#define STATUS_BAR_HEIGHT (IS_IPHONEX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (IS_IPHONEX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (IS_IPHONEX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (IS_IPHONEX ? 34.f : 0.f)

// Global Config
#define IM_APPKEY @"8a9b917ac326e770325d528127f7c46f"
#define TEST_CIRCLE_ID @"2836724"
#define AD_PLACEHOLDID 1527603864275

// h5 link
#define H5_DEV_STORE_BASE_URL @"http://app.gomoboo.com/app"
#define H5_STORE_BASE_URL @"https://m.gomoboo.com/app"

//#if DEBUG
#define IM_FileName @"mobuDev20180615"
//#else
//#define IM_FileName @"mobuDisPush"
//#endif

//设置format
#define FORMAT(f, ...)      [NSString stringWithFormat:f, ## __VA_ARGS__]

#define WOOFont(a) (([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)? ([UIFont fontWithName:@"PingFangSC-Regular" size:a]):([UIFont systemFontOfSize:a]))

#define WOOImageNamed(a) [UIImage imageNamed: a]

// 环境设置
#define WOODebugMode @"WOODebugMode"


#endif /* WOOMacro_h */

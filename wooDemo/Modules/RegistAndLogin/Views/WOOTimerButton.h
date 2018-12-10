//
//  WOOTimerButton.h
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WOOTimerButton : UIButton
@property (nonatomic, readonly) NSInteger countDownNumber;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *disableTitle;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *disableColor;

- (instancetype)initWithCountDownTime:(NSUInteger)countDown;

/**
 * Before call your callBack, NVMTimerButton will set its title to "已发送(xx)" and be disabled
 * if timer is not expired, if it is expired, its title will be reset to "重新发送" and be reabled.
 **/
- (void)setTimerCallBackBlock:(void (^)(void))timerCallBack;

- (void)startTimer;

- (void)stopTimer;

- (BOOL)isInTiming;

@end

NS_ASSUME_NONNULL_END

//
//  WOOTimerButton.m
//  wooDemo
//
//  Created by colr on 2018/12/10.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOTimerButton.h"

@interface WOOTimerButton ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger countDownNumber;
@property (nonatomic, copy) void (^timerCallBack)(void);
@property (nonatomic, assign) BOOL isInTiming;

@property (nonatomic, assign) NSUInteger innerCountDown;

@end

@implementation WOOTimerButton

- (instancetype)initWithCountDownTime:(NSUInteger)countDown {
    self = [super init];
    if (self) {
        _innerCountDown = countDown;
        _countDownNumber = countDown;
        _title = @"重新获取";
        _disableTitle = @"已发送";
        _normalColor = [UIColor whiteColor];
        _disableColor = [UIColor grayColor];
        [self setTitle:_title forState:UIControlStateNormal];
        [self setTitleColor:_normalColor forState:UIControlStateNormal];
        [self setTitle:_disableTitle forState:UIControlStateDisabled];
        [self setTitleColor:_disableColor forState:UIControlStateDisabled];
    }
    return self;
}

- (void)setUpTimer {
    if (self.timer == nil) {
        self.timer = [NSTimer timerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(timeUpdate)
                                           userInfo:nil
                                            repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)setTimerCallBackBlock:(void (^)(void))timerCallBack {
    _timerCallBack = [timerCallBack copy];
}

- (void)startTimer {
    if (self.timer == nil) {
        [self setUpTimer];
    }
    self.countDownNumber = self.innerCountDown;
    [self.timer fire];
    self.isInTiming = YES;
}

- (void)stopTimer {
    [self.timer invalidate];
}

- (BOOL)isInTiming {
    return [self.timer isValid];
}

#pragma mark - NSTimer call back

- (void)timeUpdate {
    if (self.countDownNumber > 0) {
        self.enabled = NO;
        NSString *title = self.disableTitle;
        NSString *text = [NSString stringWithFormat:@"%@(%lis)", title, (long)(self.countDownNumber)];
        [self setTitle:text forState:UIControlStateDisabled];
    } else {
        self.isInTiming = NO;
        [self.timer invalidate];
        self.timer = nil;
        self.enabled = YES;
        NSString *text = self.title;
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitle:text forState:UIControlStateDisabled];
    }
    self.countDownNumber--;
    if (self.timerCallBack) {
        self.timerCallBack();
    }
}

#pragma mark - Accessors

- (void)setTitle:(NSString *)title {
    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    [self setTitleColor:normalColor forState:UIControlStateNormal];
}

- (void)setDisableTitle:(NSString *)disableTitle {
    _disableTitle = disableTitle;
    [self setTitle:disableTitle forState:UIControlStateDisabled];
}

- (void)setDisableColor:(UIColor *)disableColor {
    _disableColor = disableColor;
    [self setTitleColor:disableColor forState:UIControlStateDisabled];
}


@end

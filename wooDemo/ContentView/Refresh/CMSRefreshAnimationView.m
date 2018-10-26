//
//  CMSRefreshAnimationView.m
//  cosmos
//
//  Created by colr on 2018/6/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "CMSRefreshAnimationView.h"

@interface CMSRefreshAnimationView()<CAAnimationDelegate>

@property (copy ,nonatomic) NSString * countStr;

@property (strong ,nonatomic) UILabel * freshLabel;

@property (assign ,nonatomic) CGRect oldFrame;

@end

@implementation CMSRefreshAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.freshLabel];
        self.freshLabel.alpha = 0;
        _offsetY = 40;
        self.oldFrame = frame;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.freshLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(150, 32));
    }];
}

- (void)showWithContentNum:(NSString *)count completion:(void (^)(BOOL))completion {
    if (!count) {
        return;
    }
    if (self.finishiBlock) {
        self.finishiBlock = completion;
    }
    self.freshLabel.text = FORMAT(@"发现%@条新内容",count);
    [self startAnimation];
}

- (void)showWithContentNum:(NSString *)count {
    if (!count) {
        return;
    }
    self.freshLabel.text = FORMAT(@"发现%@条新内容",count);
    [self startAnimation];
}

- (void)startAnimation {
    self.freshLabel.alpha = 1;
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.4];
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    // 设置动画不还原
    animation.fillMode = @"forwards";
    [animation setFromValue:[NSValue valueWithCGPoint:CGPointMake(VERTICAL_SCREEN_WIDTH/2, 0)]];
    [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(VERTICAL_SCREEN_WIDTH/2, self.offsetY)]];
    [self.freshLabel.layer addAnimation:animation forKey:@"anim"];
}

- (UILabel *)freshLabel {
    if (!_freshLabel) {
        _freshLabel = UILabel.label.WH_font(WOOFont(14)).WH_textColor(woo_colorWithHexString(@"ffffff")).WH_textAlignment(NSTextAlignmentCenter);
        _freshLabel.backgroundColor = woo_colorWithHexString(@"5C6AFF");
        _freshLabel.layer.cornerRadius = 16;
        _freshLabel.clipsToBounds = YES;
    }
    return _freshLabel;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.freshLabel.alpha = 0;
            [self.freshLabel.layer removeAnimationForKey:@"anim"];
            [self removeFromSuperview];
            if (self.finishiBlock) {
                self.finishiBlock(YES);
            }
        });
    }else{
        self.freshLabel.alpha = 0;
        [self.freshLabel.layer removeAnimationForKey:@"anim"];
        [self removeFromSuperview];
        if (self.finishiBlock) {
            self.finishiBlock(YES);
        }
    }
}
@end

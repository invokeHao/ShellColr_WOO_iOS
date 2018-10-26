//
//  CMSRefreshAnimationView.h
//  cosmos
//
//  Created by colr on 2018/6/11.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMSRefreshAnimationView : UIView

@property (nonatomic, assign) CGFloat offsetY;

@property (nonatomic, copy)void (^finishiBlock)(BOOL isFinish);

- (void)showWithContentNum:(NSString *)count completion:(void(^)(BOOL isFinish))completion;

- (void)showWithContentNum:(NSString *)count;

@end

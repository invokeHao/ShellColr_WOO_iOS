//
//  CMSMJRefreshHeader.m
//  cosmos
//
//  Created by colr on 2018/5/25.
//  Copyright © 2018年 Shell&Colr. All rights reserved.
//

#import "CMSMJRefreshHeader.h"

@interface CMSMJRefreshHeader ()

@property(weak, nonatomic) UIView * headerFreshView;
@property(weak, nonatomic)UILabel * label;
@property (strong,nonatomic) UIActivityIndicatorView * loadingView;


@end

@implementation CMSMJRefreshHeader
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    // 设置控件的高度
    self.mj_h = 30 + STATUS_BAR_HEIGHT;
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    self.headerFreshView = view;
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12.0];
    label.textAlignment = NSTextAlignmentCenter;
    [self.headerFreshView addSubview:label];
    self.label = label;
    
    
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.headerFreshView.bounds = CGRectMake(0, 0, 120, 30 + STATUS_BAR_HEIGHT);
    
    self.headerFreshView.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
    
    self.label.frame = CGRectMake(30, 0, 80, 20);
    
    self.loadingView.bounds = CGRectMake(0, 0, 10, 10);
    
    self.loadingView.center = CGPointMake(60, self.headerFreshView.height - 15);
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}



#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.label.text = @"下拉刷新";
            [self endAnimation];
            break;
        case MJRefreshStatePulling:
            self.label.text = @"松开加载更多";
            [self endAnimation];
            break;
        case MJRefreshStateRefreshing:
            self.label.text = @"加载中...";
            [self startAnimation];
            break;
        default:
            break;
    }
}



#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    self.label.textColor = [UIColor clearColor];
}


#pragma mark- 菊花
- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        loadingView.hidesWhenStopped = YES;
        [self.headerFreshView addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

- (void)startAnimation {
    [self.loadingView startAnimating];
}

- (void)endAnimation {
    [self.loadingView stopAnimating];
    [self.loadingView setHidden:YES];
}

@end

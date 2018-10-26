//
//  WOOTabBarViewController.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOTabBarViewController.h"
#import <GDPerformanceMonitor.h>
#import "WOOMineHomePageVC.h"
#import "WOOFlowListVC.h"

NSString * const WOOTabViewControllerSwitchoverTabNotification = @"WOOTabViewControllerSwitchoverTabNotification";

@interface WOOTabBarViewController ()

@property (nonatomic, strong) UIImageView *topImageView;
//@property (nonatomic, strong) UIImageView *bottomImageView;

@property (nonatomic, assign) WOOTabViewControllerType type;
@property (nonatomic, assign) CGFloat tabBarY;

#ifdef DEBUG
@property (nonatomic, strong) GDPerformanceMonitor *performanceMonitor;
#endif

@end

@implementation WOOTabBarViewController

#pragma mark - class method

+ (void)switchoverTab:(WOOTabViewControllerType)type {
    [[NSNotificationCenter defaultCenter] postNotificationName:WOOTabViewControllerSwitchoverTabNotification
                                                        object:@(type)];
}

#pragma mark - life clyce

- (instancetype)initWithTabViewControllerType:(WOOTabViewControllerType)type
{
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self initViewControllers];
    [self configurationTab];
    [self addNotification];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)setupUI {
    [self.view insertSubview:self.topImageView atIndex:0];
    //    [self.view insertSubview:self.bottomImageView belowSubview:self.tabBar];
    self.topImageView.frame = CGRectMake(0, (IS_IPHONEX ? 0 : -24), VERTICAL_SCREEN_WIDTH, 175);
    //    self.bottomImageView.frame = CGRectMake(0, VERTICAL_SCREEN_HEIGHT-150-HOME_INDICATOR_HEIGHT, VERTICAL_SCREEN_WIDTH, 150);
    
    //debug 头部帧数显示控件
#ifdef DEBUG
    self.performanceMonitor = [[GDPerformanceMonitor alloc] init];
    [self.performanceMonitor startMonitoring];
#endif
}

- (void)initViewControllers {
    
    WOOFlowListVC *flow = [[WOOFlowListVC alloc] init];
    flow.yp_tabItemImage = [UIImage imageNamed:@"ico_explore_unselected"];
    flow.yp_tabItemSelectedImage = [UIImage imageNamed:@"ico_explore_selected"];
    flow.yp_tabItemTitle = @"内容流";

    
    WOOMineHomePageVC *myAccount = [[WOOMineHomePageVC alloc] init];
    myAccount.yp_tabItemImage = [UIImage imageNamed:@"ico_my_profile_unselected"];
    myAccount.yp_tabItemSelectedImage = [UIImage imageNamed:@"ico_my_profile_selected"];
    myAccount.yp_tabItemTitle = @"我";
    
    self.viewControllers = [NSMutableArray arrayWithObjects:flow, myAccount, nil];
}

- (void)configurationTab {
    
    self.view.backgroundColor = [UIColor woo_colorWithHexString:@"171826"];
    self.tabBar.backgroundColor = [UIColor clearColor];
    
    CGFloat tabBarHeight = 60;
    CGFloat margin = (VERTICAL_SCREEN_WIDTH / 4.0) / 2.0 - 2;
    CGFloat contentHeight = VERTICAL_SCREEN_HEIGHT - HOME_INDICATOR_HEIGHT - tabBarHeight;
    if (IS_IPHONEX) {
        [self setTabBarFrame:CGRectMake(0, self.tabBarY, VERTICAL_SCREEN_WIDTH, tabBarHeight)
            contentViewFrame:CGRectMake(0, 0, VERTICAL_SCREEN_WIDTH, contentHeight)];
    } else {
        [self setTabBarFrame:CGRectMake(0, self.tabBarY, VERTICAL_SCREEN_WIDTH, tabBarHeight)
            contentViewFrame:CGRectMake(0, 0, VERTICAL_SCREEN_WIDTH, contentHeight)];
    }
    
    self.tabBar.itemTitleColor = [UIColor whiteColor];
    self.tabBar.itemTitleSelectedColor = [UIColor whiteColor];
    self.tabBar.itemTitleFont = WOOFont(10);
    self.tabBar.itemTitleSelectedFont = WOOFont(10);
    self.tabBar.itemColorChangeFollowContentScroll = YES;
    
    [self.tabBar setItemContentHorizontalCenterWithVerticalOffset:20 spacing:3];
    [self setContentScrollEnabled:NO tapSwitchAnimated:NO];
    
    self.defaultSelectedControllerIndex = self.type;
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(switchoverTabNotification:)
                                                 name:WOOTabViewControllerSwitchoverTabNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter ] addObserver:self
                                              selector:@selector(didChangeStatusBarFrameNotification:)
                                                  name:UIApplicationDidChangeStatusBarFrameNotification
                                                object:nil];
    
}

#pragma mark - event response

- (void)switchoverTabNotification:(NSNotification *)notification  {
    NSNumber *typeNumber = (NSNumber *)notification.object;
    NSInteger type = [typeNumber integerValue];
    self.selectedControllerIndex = type;
}

- (void)didChangeStatusBarFrameNotification:(NSNotification *)notification  {
    self.tabBar.y = self.tabBarY;
    self.view.y = 0;
    self.view.height = VERTICAL_SCREEN_HEIGHT - STATUSBAR_HEIGHT + STATUS_BAR_HEIGHT;
}


#pragma mark - getting

- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
        _topImageView.contentMode = UIViewContentModeScaleAspectFill;
        _topImageView.image = [UIImage imageNamed:@"bg_homepage_head"];
    }
    return _topImageView;
}

//- (UIImageView *)bottomImageView {
//    if (!_bottomImageView) {
//        UIImage *originImage = [UIImage imageNamed:@"mask_scrollscene_bottom"];
//        originImage = [originImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)
//                                                  resizingMode:UIImageResizingModeStretch];
//        _bottomImageView = [[UIImageView alloc] init];
//        _bottomImageView.contentMode = UIViewContentModeScaleToFill;
//        _bottomImageView.clipsToBounds = YES;
//        _bottomImageView.image = originImage;
//    }
//    return _bottomImageView;
//}

- (CGFloat)tabBarY {
    CGFloat tabBarHeight = 70;
    return VERTICAL_SCREEN_HEIGHT - tabBarHeight - HOME_INDICATOR_HEIGHT - STATUSBAR_HEIGHT + STATUS_BAR_HEIGHT;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

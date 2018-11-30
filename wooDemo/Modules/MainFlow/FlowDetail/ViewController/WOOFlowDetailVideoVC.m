//
//  WOOFlowDetailVideoVC.m
//  wooDemo
//
//  Created by colr on 2018/11/22.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOFlowDetailVideoVC.h"
#import "WOOMainFlowListApi.h"
#import "WOOMainVideoModel.h"
#import "WOOVideoModel.h"
#import "WOOFeedbackApi.h"
#import <SuperPlayer/SuperPlayer.h>
#import <SuperPlayer/UIView+MMLayout.h>

@interface WOOFlowDetailVideoVC ()<SuperPlayerDelegate>

@property UIView *backView;
@property UIView *playerContainer;
@property SuperPlayerView *playerView;
@property CGPoint startPoint;
@property CGPoint originPoint;

@property (nonatomic ,strong) UILabel * titleLabel;

@property (assign, nonatomic)NSInteger readStarTime;

@property (assign, nonatomic)NSInteger readEndTime;

@property (nonatomic, strong)NSString * videoUrl;

@property (assign, nonatomic)BOOL completeRead; //完成阅读

@end

@implementation WOOFlowDetailVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.playerView resetPlayer];
    self.readEndTime = [self getTheCurrentTime];
    if (self.readEndTime - self.readStarTime > 1000) {
        [self feedbackTheReadLog];
    }
}

- (void)dealloc {
    NSLog(@"WOOFlowDetailVideoVC释放");
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)setupView {
    self.backView = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.backView];
    [self.view addSubview:self.titleLabel];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.playerContainer = [[UIView alloc] init];
    self.playerContainer.backgroundColor = [UIColor blackColor];
    [self.backView addSubview:self.playerContainer];
    self.backView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    CGFloat H = self.view.width*9.0/16.0f;
    [self.playerContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(H);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.playerContainer.mas_bottom).offset(20);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    _playerView = [[SuperPlayerView alloc] init];
    // 设置父View
    _playerView.disableGesture = YES;
    self.playerView.fatherView = self.playerContainer;
}

- (void)configTheModel:(WOOMainVideoModel * )model {
    NSArray * videoArr = model.video_list;
    NSMutableArray * urlArr = [NSMutableArray arrayWithCapacity:0];
    for (WOOVideoModel * video in videoArr) {
        SuperPlayerUrl * url = [SuperPlayerUrl new];
        url.url = video.main_url;
        url.title = video.definition;
        [urlArr addObject:url];
    }
    
    SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
    playerModel.multiVideoURLs = [urlArr copy];
    SuperPlayerUrl * url = [urlArr firstObject];
    playerModel.videoURL = url.url; // 设置默认播放的清晰度
    // 开始播放
    [_playerView playWithModel:playerModel];
    _playerView.delegate = self;
    
    self.titleLabel.text = self.titleStr;
    self.readStarTime = [self getTheCurrentTime];
}


- (void)setupData {
    if (self.video_id.length > 0) {
        [WOOMainFlowListApi getTheDetailVideoUrlWithVideoId:self.video_id completion:^(WOOMainVideoModel * _Nonnull model, NSError *error) {
            [self configTheModel:model];
        }];
    }
}

- (void)feedbackTheReadLog {
    NSMutableDictionary * pramDic = [NSMutableDictionary dictionary];
    if (self.readEndTime > 0) {
        NSInteger time = self.readEndTime - self.readStarTime;
        NSNumber * timeNum = [NSNumber numberWithInteger:time];
        [pramDic setValue:timeNum forKey:@"time"];
    }
    if (self.itemId) {
        [pramDic setValue:self.itemId forKey:@"group_id"];
    }
    [pramDic setValue:[NSNumber numberWithBool:self.completeRead] forKey:@"complete"];
    [WOOFeedbackApi postTheReadLogWithDataDic:pramDic completion:^(BOOL success, NSError * _Nonnull error) {
        if (!error) {
            NSLog(@"success");
            NSInteger time = floor((self.readEndTime - self.readStarTime) / 1000);
            NSString * timeStr = FORMAT(@"您已观看%ld秒",time);
            NSString * resultStr = nil;
            if (self.completeRead) {
                resultStr = FORMAT(@"%@,您已观看全部",timeStr);
            }else{
                resultStr = FORMAT(@"%@,您未观看全部",timeStr);
            }
            [WOOHud showString:resultStr];
        }else{
            NSLog(@"%@",error);
        }
    }];
}

- (NSInteger )getTheCurrentTime {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970] * 1000;// 精确到毫秒
    return time;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.label.WH_font(WOOFont(15)).WH_numberOfLines(0);
    }
    return _titleLabel;
}

#pragma mark- superPlayer delegate

- (void)superPlayerDidEnd:(SuperPlayerView *)player {
    self.completeRead = YES;
}

- (void)superPlayerBackAction:(SuperPlayerView *)player {
    [self.navigationController popViewControllerAnimated:YES];
}


@end

//
//  WOOFlowDetailVC.m
//  wooDemo
//
//  Created by colr on 2018/11/20.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOFlowDetailVC.h"
#import "WOOMainFlowListApi.h"
#import "WOOFeedbackApi.h"

@interface WOOFlowDetailVC ()<WKNavigationDelegate,WKUIDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) UIProgressView *progressView;

@property (assign, nonatomic)NSInteger readStarTime;

@property (assign, nonatomic)NSInteger readEndTime;

@property (assign, nonatomic)BOOL completeRead; //完成阅读

@property (assign, nonatomic)BOOL allowZooming; //允许缩放

@property (assign, nonatomic)CGFloat ZoomScale; //缩放大小

@property (assign, nonatomic)BOOL canRead; //可以阅读
@end

@implementation WOOFlowDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setUpData];
    [self addObserver];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.readEndTime = [self getTheCurrentTime];
    if (self.readEndTime - self.readStarTime > 1000 && self.canRead) {
        [self feedbackTheReadLog];
    }
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    NSLog(@"WOOFlowDetailVC释放");
}

- (void)addObserver {
    [self.webView addObserver:self
                   forKeyPath:@"estimatedProgress"
                      options:NSKeyValueObservingOptionNew context:nil];
}


- (void)setupView {
    self.navBar.hidden = NO;
    self.navBar.titleLabel.text = @"详情";
    self.navBar.backgroundColor = [UIColor woo_colorWithHexString:@"D8D8D8"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    self.allowZooming = YES;
    [self.webView.scrollView setMaximumZoomScale:1.1];
    [self.webView.scrollView setMinimumZoomScale:0.9];
}

- (void)configThehtmlStr:(NSString *)htmlStr {
    //处理标题
    NSString * targetStr = [htmlStr stringByReplacingOccurrencesOfString:@"tt-title" withString:@"title"];

    //处理图片
    targetStr = [htmlStr stringByReplacingOccurrencesOfString:@"bytedance://large_image?url=" withString:@""];
    targetStr = [targetStr stringByReplacingOccurrencesOfString:@"a class=\"image\"" withString:@"img"];
    targetStr = [targetStr stringByReplacingOccurrencesOfString:@"</a>" withString:@""];
    targetStr = [targetStr stringByReplacingOccurrencesOfString:@"href" withString:@"src"];
    //蠢方法处理图片尾部
    for (int i = 100; i >= 0; i--) {
        NSString * indexStr = FORMAT(@"&index=%d",i);
        if ([targetStr containsString:indexStr]) {
            targetStr = [targetStr stringByReplacingOccurrencesOfString:indexStr withString:@""];
        }
    }
    targetStr = [self decodeString:targetStr];
    NSLog(@"%@",targetStr);
    
//    ONOXMLDocument * document = [ONOXMLDocument HTMLDocumentWithString:targetStr encoding:NSUTF8StringEncoding error:nil];
//    ONOXMLElement * element = [document.rootElement firstChildWithTag:@"article"];
    
    
    NSString *htmlString = [NSString stringWithFormat:@"<html> \n"
                            "<head> \n"
                            "<style type=\"text/css\"> \n"
                            "body {font-size:32px;}\n"
                            "</style> \n"
                            "</head> \n"
                            "<body>"
                            "<script type='text/javascript'>"
                            "window.onload = function(){\n"
                            "var $img = document.getElementsByTagName('img');\n"
                            "for(var p in  $img){\n"
                            " $img[p].style.width = '100%%';\n"
                            "$img[p].style.height ='auto'\n"
                            "}\n"
                            "}"
                            "</script>%@"
                            "</body>"
                            "</html>", targetStr];
    self.canRead = targetStr.length > 0 ;
    if (targetStr.length > 0) {
        [self.webView loadHTMLString:htmlString baseURL:nil];
    }
}

- (void)setUpData {
    if (!self.itemId) {return;}
    @weakify(self);
    [WOOMainFlowListApi getTheDetailDataWithItemID:self.itemId completion:^(NSString * _Nonnull htmlStr, NSError * _Nonnull error) {
        @strongify(self);
        [self configThehtmlStr:htmlStr];
    }];
}

#pragma mark - WKNavigationDelegate

// 准备加载页面
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    //    CMSLogMethod();
    self.progressView.hidden = NO;
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    [self.view bringSubviewToFront:self.progressView];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    self.progressView.hidden = YES;
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [self configTheFont];
    self.readStarTime = [self getTheCurrentTime];
    self.allowZooming = NO;
    self.ZoomScale = self.webView.scrollView.zoomScale;
}

#pragma mark - progress kvo

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        BOOL animated = self.webView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.webView.estimatedProgress
                              animated:animated];
        
        if (self.webView.estimatedProgress >= 1.0f) {
            @weakify(self);
            [UIView animateWithDuration:0.25f delay:0.25f options:UIViewAnimationOptionCurveEaseOut animations:^{
                @strongify(self);
                self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                @strongify(self);
                self.progressView.hidden = YES;
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)setHiddenProgressView:(BOOL)hiddenProgressView {
    self.progressView.alpha = hiddenProgressView ? 0.0 : 1.0;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if (!self.allowZooming) {
        scrollView.zoomScale = self.ZoomScale;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat height = scrollView.frame.size.height + 10;
    CGFloat contentYoffset = scrollView.contentOffset.y;
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
    NSLog(@"height:%f contentYoffset:%f frame.y:%f",height,contentYoffset,scrollView.frame.origin.y);
    if (distanceFromBottom < height && !self.allowZooming) {
        self.completeRead = YES;
    }
}


- (void)configTheFont {
    //修改字体大小 300%
//    [self.webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '230%'"completionHandler:nil];
    
//        [self.webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.fontSize= '32px'"completionHandler:nil];
//
//    //修改字体颜色  #9098b8
//    [self.webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#2d2d2d'"completionHandler:nil];
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
            NSString * timeStr = FORMAT(@"您已阅读%ld秒",time);
            NSString * resultStr = nil;
            if (self.completeRead) {
                resultStr = FORMAT(@"%@,您已阅读到底部",timeStr);
            }else{
                resultStr = FORMAT(@"%@,您未阅读到底部",timeStr);
            }
            [WOOHud showString:resultStr];

        }else{
            NSLog(@"%@",error);
        }
    }];
}


- (WKWebView *)webView {
    if (!_webView) {
        CGRect webFrame = CGRectMake(0, NAVIGATION_BAR_HEIGHT, self.view.bounds.size.width, self.view.bounds.size.height - NAVIGATION_BAR_HEIGHT);
        WKWebViewConfiguration *webConfiguration = [[WKWebViewConfiguration alloc] init];
        webConfiguration.allowsInlineMediaPlayback = YES;
        webConfiguration.allowsAirPlayForMediaPlayback = YES;//允许播放，ios(8.0, 9.0)
        webConfiguration.mediaTypesRequiringUserActionForPlayback = NO;
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        webConfiguration.userContentController = userContentController;
        _webView = [[WKWebView alloc] initWithFrame:webFrame configuration:webConfiguration];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        _webView.scrollView.delegate = self;
        _webView.opaque = NO;
    }
    return _webView;
}

- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, [[UIScreen mainScreen] bounds].size.width, 2)];
        _progressView.backgroundColor = [UIColor clearColor];
        _progressView.progressTintColor= [UIColor woo_colorWithHexString:@"F5A623"];
        _progressView.trackTintColor = [UIColor clearColor];
        _progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    }
    return _progressView;
}

-(NSString *)decodeString:(NSString*)encodedString {
    NSString *decodedString = [encodedString stringByRemovingPercentEncoding];
    if (decodedString == nil) {
        NSLog(@"%@",encodedString);
    }
    return decodedString;
}

- (NSInteger )getTheCurrentTime {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970] * 1000;// 精确到毫秒
    return time;
}

@end

//
//  WOOFlowListVC.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOFlowListVC.h"
#import "WOOBaseCollectionView.h"
#import "WOOInsJiuSectionController.h"
#import "WOOInsJiuBottomSectionController.h"
#import "WOOInsInformationSectionController.h"
#import "WOOInsInformationBottomSectionController.h"
#import "WOOJiuListDemoModel.h"
#import "WOOJiuListViewModel.h"

@interface WOOFlowListVC ()<IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) WOOBaseCollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * bottomDataList;
@property (nonatomic, strong) WOOJiuListViewModel * jiuViewModel;
@end

@implementation WOOFlowListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindingData];
    [self setupData];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = woo_colorWithHexString(@"F2F2F2");
    self.navBar.hidden = YES;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-HOME_INDICATOR_HEIGHT);
    }];

    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
    self.adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
    self.adapter.dataSource = self;
    self.adapter.collectionView = self.collectionView;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray * mutableArr = [NSMutableArray arrayWithCapacity:0];
    for (WOOJiuListDemoModel * model in self.jiuViewModel.dataList) {
        [mutableArr addObject: model];
    }
    return [mutableArr copy];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
        IGListStackedSectionController *sc = [[IGListStackedSectionController alloc]
                                          initWithSectionControllers:@[
                                            [[WOOInsInformationSectionController alloc] init],
                                                                    
                                            [[WOOInsJiuSectionController alloc] init],
                                                                    
                                            [[WOOInsJiuBottomSectionController alloc] init],
                                                                    
                                            [[WOOInsInformationBottomSectionController alloc] init]
                                                                       ]];
    sc.inset = UIEdgeInsetsMake(20, 24, 0, 24);
    sc.minimumLineSpacing = 20;
    return sc;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (WOOBaseCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[WOOBaseCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
    }
    return _collectionView;
}


- (NSMutableArray *)bottomDataList {
    if (!_bottomDataList) {
        _bottomDataList = [NSMutableArray arrayWithCapacity:0];
    }
    return _bottomDataList;
}

- (void)setupData {
    self.jiuViewModel = [[WOOJiuListViewModel alloc]init];
    @weakify(self)
    [self.collectionView setHeaderRefreshingBlock:^{
        @strongify(self)
        [self.jiuViewModel fetchMainFlowListWithRefreshType:WOORefreshTypeHeader];
    }];
    [self.collectionView setFooterRefreshingBlock:^{
        @strongify(self)
        [self.jiuViewModel fetchMainFlowListWithRefreshType:WOORefreshTypeFooter];
    }];
    
    [self.jiuViewModel.errorSubject subscribeNext:^(id x) {
        @strongify(self);
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        NSLog(@"%@",x);
    }];
}

- (void)refreshTheFlowData {
    [self.collectionView.mj_header beginRefreshing];
}

- (void)bindingData{
    @weakify(self);
    [[RACObserve(self, jiuViewModel.dataList) skip:1] subscribeNext:^(NSArray *articleArr) {
        @strongify(self);
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        if (articleArr.count > 0) {
            [self.adapter reloadDataWithCompletion:NULL];
        }
    }];
}

@end

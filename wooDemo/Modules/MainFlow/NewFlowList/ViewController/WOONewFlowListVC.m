//
//  WOONewFlowListVC.m
//  wooDemo
//
//  Created by colr on 2018/12/4.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOONewFlowListVC.h"
#import "WOONewFlowListViewModel.h"
#import "WOOBaseCollectionView.h"
#import "WOONewListTopSC.h"
#import "WOOGoodsListSC.h"
#import "WOOHotVideoSC.h"
#import "WOONewBottomListSC.h"
#import "WOONewHeaderSC.h"

@interface WOONewFlowListVC ()<IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) WOOBaseCollectionView * collectionView;
@property (nonatomic, strong) WOONewFlowListViewModel * ViewModel;
@end

@implementation WOONewFlowListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupData];
    [self bindingData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.hidden = YES;
}

- (void)setupViews {
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
    for (WOONewListModel * model in self.ViewModel.dataList) {
        [mutableArr addObject:model];
    }
    return [mutableArr copy];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    IGListStackedSectionController *sc = [[IGListStackedSectionController alloc]
                                          initWithSectionControllers:@[
                                                                       [[WOONewHeaderSC alloc] init],
                                                                       [[WOONewListTopSC alloc] init],
                                                                       
                                                                       [[WOOGoodsListSC alloc] init],
                                                                       
                                                                       [[WOOHotVideoSC alloc] init],
                                                                       
                                                                       [[WOONewBottomListSC alloc] init]
                                                                       ]];
    [sc isFirstSection];
    sc.inset = UIEdgeInsetsMake(20, 15, 0, 15);
    sc.minimumLineSpacing = 15;
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

- (void)setupData {
    self.ViewModel = [[WOONewFlowListViewModel alloc]init];
    @weakify(self)
    [self.collectionView setHeaderRefreshingBlock:^{
        @strongify(self)
        [self.ViewModel fetchMainFlowListWithRefreshType:WOORefreshTypeHeader];
    }];
    [self.collectionView setFooterRefreshingBlock:^{
        @strongify(self)
        [self.ViewModel fetchMainFlowListWithRefreshType:WOORefreshTypeFooter];
    }];
    
    [self.ViewModel.errorSubject subscribeNext:^(id x) {
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
    [[[RACObserve(self, ViewModel.dataList) skip:1] deliverOnMainThread] subscribeNext:^(NSArray *articleArr) {
        @strongify(self);
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
        if (articleArr.count > 0) {
            [self.adapter reloadDataWithCompletion:NULL];
        }
    }];
}

@end

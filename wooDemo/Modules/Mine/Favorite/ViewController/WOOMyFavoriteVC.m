//
//  WOOMyFavoriteVC.m
//  wooDemo
//
//  Created by colr on 2018/12/13.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMyFavoriteVC.h"
#import "WOOMyFavoriteVM.h"
#import "WOOMyFavoriteCell.h"
#import "WOOGoodsDetailVC.h"

@interface WOOMyFavoriteVC ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)WOOMyFavoriteVM * viewModel;

@property (nonatomic, strong)WOOBaseCollectionView * collectionView;

@end

@implementation WOOMyFavoriteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self bindingData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.titleLabel.text = @"";
    self.navBar.backgroundColor = woo_colorWithHexString(@"#FAFAFA");
}

- (void)setupViews {
    self.viewModel = [[WOOMyFavoriteVM alloc]init];
    self.view.backgroundColor = woo_colorWithHexString(@"#FAFAFA");
    [self.view addSubview:self.collectionView];

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVIGATION_BAR_HEIGHT);
        make.left.right.bottom.mas_equalTo(0);
    }];

    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)bindingData {
    @weakify(self);
    [[[RACObserve(self, viewModel.dataList) skip:1] deliverOnMainThread] subscribeNext:^(NSArray *x) {
        @strongify(self);
        [self.collectionView stopRefresh];
        [self.collectionView reloadData];
    }];

}

#pragma mark - getting

- (WOOBaseCollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 20;
        layout.minimumInteritemSpacing = 20;
        CGFloat width = (VERTICAL_SCREEN_WIDTH - 100) / 3.0;
        layout.itemSize = CGSizeMake(width, width);
        layout.sectionInset = UIEdgeInsetsMake(20, 30, 10, 30);
        _collectionView = [[WOOBaseCollectionView alloc] initWithFrame:CGRectZero
                                                  collectionViewLayout:layout];
        [_collectionView registerClass:[WOOMyFavoriteCell class] forCellWithReuseIdentifier:[WOOMyFavoriteCell reuseID]];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView openRefreshWithRefreshType:(WOORefreshTypeAll)];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WOOGoodsModel *model = self.viewModel.dataList[indexPath.row];
    WOOMyFavoriteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[WOOMyFavoriteCell reuseID] forIndexPath:indexPath];
    [cell setModel:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    WOOGoodsModel * model = self.viewModel.dataList[indexPath.item];
    WOOGoodsDetailVC * detailVC = [[WOOGoodsDetailVC alloc]init];
    detailVC.goodsModel = model;
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end

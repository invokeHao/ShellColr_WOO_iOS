//
//  WOOFlowListVC.m
//  wooDemo
//
//  Created by colr on 2018/10/26.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOFlowListVC.h"
#import "WOOInsJiuSectionController.h"
#import "WOOInsJiuBottomSectionController.h"
#import "WOOInsInformationSectionController.h"
#import "WOOJIuDemoModel.h"
#import "WOOJiuListDemoModel.h"

@interface WOOFlowListVC ()<IGListAdapterDataSource>
@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) ASCollectionNode *collectionNode;
@property (nonatomic, strong) NSMutableArray * dataList;
@property (nonatomic, strong) NSMutableArray * bottomDataList;
@end

@implementation WOOFlowListVC

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    ASCollectionNode * collectionNode = [[ASCollectionNode alloc]initWithCollectionViewLayout:layout];
    if (self = [super initWithNode:collectionNode]) {
        IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
        _adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
        _adapter.dataSource = self;
        [_adapter setASDKCollectionNode:self.collectionNode];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUI];
    [self.adapter reloadDataWithCompletion:NULL];
}

- (void)setupUI {
    self.collectionNode.view.alwaysBounceVertical = YES;

//    [self.collectionNode mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(0);
//        make.leading.trailing.equalTo(self.view);
//        make.bottom.equalTo(self.view).offset(-HOME_INDICATOR_HEIGHT);
//    }];

//    if (@available(iOS 11.0, *)) {
//        self.collectionNode.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    
//    IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
//    self.adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
//    self.adapter.dataSource = self;
//    self.adapter.collectionView = self.collectionView;
//    [self.adapter setASDKCollectionNode:self.collectionNode];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray * mutableArr = [NSMutableArray arrayWithCapacity:0];
    for (WOOJiuListDemoModel * model in self.dataList) {
        [mutableArr addObject: model];
    }
    return [mutableArr copy];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    
    if ([object isKindOfClass:[WOOJiuListDemoModel class]]) {
        return [[WOOInsInformationSectionController alloc]init];
    }else{
        return nil;
    }
//    IGListStackedSectionController *sc = [[IGListStackedSectionController alloc]
//                                          initWithSectionControllers:@[
//                                                                       [[WOOInsInformationSectionController alloc] init],
//                                                                       [[WOOInsJiuSectionController alloc] init],
//                                                                       [[WOOInsJiuBottomSectionController alloc] init],
//                                                                       [[WOOInsInformationSectionController alloc] init]
//                                                                       ]];
//    sc.inset = UIEdgeInsetsMake(3, 3, 10, 3);
//    sc.minimumLineSpacing = 3;
//    sc.minimumInteritemSpacing = 3;
//    return sc;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


//- (UICollectionView *)collectionView {
//    if (!_collectionView) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
//        [_collectionView setBackgroundColor:[UIColor clearColor]];
//    }
//    return _collectionView;
//}

- (ASCollectionNode *)collectionNode {
    return self.node;
}

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataList;
}

- (NSMutableArray *)bottomDataList {
    if (!_bottomDataList) {
        _bottomDataList = [NSMutableArray arrayWithCapacity:0];
    }
    return _bottomDataList;
}

- (void)setupData {
    NSArray * titleArr = @[@"资讯",@"视频",@"图片",@"商品",@"音乐"];
    for (int j = 0; j < 3; j ++) {
        NSMutableArray * mutableArr = [NSMutableArray arrayWithCapacity:0];
        NSMutableArray * bottomMArr = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i< 6; i++) {
            int index = arc4random() % 5;
            WOOJIuDemoModel * model = [[WOOJIuDemoModel alloc]init];
            model.title = titleArr[index];
            model.IDS = FORMAT(@"%d",i);
            if (i<3) {
                [mutableArr addObject:model];
            }else{
                [bottomMArr addObject:model];
            }
        }
        WOOJiuListDemoModel * listModel = [[WOOJiuListDemoModel alloc]init];
        listModel.dataArray = [mutableArr copy];
        listModel.firstModel = [mutableArr firstObject];
        listModel.bottomArray = [bottomMArr copy];
        listModel.lastModel = [bottomMArr lastObject];
        [self.dataList addObject:listModel];
    }
}


@end

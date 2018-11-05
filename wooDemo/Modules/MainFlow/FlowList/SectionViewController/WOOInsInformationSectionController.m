//
//  WOOInsInformationSectionController.m
//  wooDemo
//
//  Created by colr on 2018/10/30.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOInsInformationSectionController.h"
#import "WOOJiuListDemoModel.h"
#import "WOOInsJiuCell.h"
#import "WOOJiuCellNode.h"

@interface WOOInsInformationSectionController ()<ASSectionController>

@property (nonatomic, strong)WOOJiuListDemoModel <IGListDiffable>* listModel;

@property (nonatomic, strong, readonly) dispatch_queue_t diffingQueue;

@property (nonatomic, copy) WOOJiuListDemoModel <IGListDiffable>* pendingModel;

@property (nonatomic) BOOL initialItemsRead;

@end

@implementation WOOInsInformationSectionController

@synthesize diffingQueue = _diffingQueue;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(3, 3, 3, 3);
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
//    CGFloat width = self.collectionContext.containerSize.width;
//    return CGSizeMake(width - 6 , 88);
    return [ASIGListSectionControllerMethods sizeForItemAtIndex:index];
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
//    WOOInsJiuCell *cell = [self.collectionContext dequeueReusableCellOfClass:[WOOInsJiuCell class] forSectionController:self atIndex:index];
//    WOOJIuDemoModel * model = self.listModel.firstModel;
//    [cell setModel:model];
//    return cell;
    return [ASIGListSectionControllerMethods cellForItemAtIndex:index sectionController:self];
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[WOOJiuListDemoModel class]]) {
        
        dispatch_async(self.diffingQueue, ^{
            IGListIndexSetResult * result = IGListDiff(@[self.pendingModel], @[object], IGListDiffPointerPersonality);
            dispatch_async(dispatch_get_main_queue(), ^{
                id<IGListCollectionContext> ctx = self.collectionContext;
                [ctx performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
                    [batchContext insertInSectionController:(id)self atIndexes:result.inserts];
                    [batchContext deleteInSectionController:(id)self atIndexes:result.deletes];
                    self.listModel = object;
                } completion:^(BOOL finished) {

                }];
            });
        });
    }
}

- (WOOJiuListDemoModel<IGListDiffable> *)pendingModel {
    if (!_pendingModel) {
        _pendingModel = [[WOOJiuListDemoModel alloc]init];
    }
    return _pendingModel;
}

- (dispatch_queue_t)diffingQueue
{
    if (_diffingQueue == nil) {
        _diffingQueue = dispatch_queue_create("ASCollectionSectionController.diffingQueue", DISPATCH_QUEUE_SERIAL);
    }
    return _diffingQueue;
}

- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    WOOJIuDemoModel * model = self.listModel.firstModel;
    [WOOHud showString:model.title];
}

-(void)beginBatchFetchWithContext:(ASBatchContext *)context {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.listModel) {
            
        }
    });
}

- (nonnull ASCellNodeBlock)nodeBlockForItemAtIndex:(NSInteger)index {
    ASCellNode *(^nodeBlock)() = ^{
        WOOJiuCellNode *cellNode = [[WOOJiuCellNode alloc] init];
        [cellNode setModel:self.listModel.firstModel];
        return cellNode;
    };
    return nodeBlock;
}

@end

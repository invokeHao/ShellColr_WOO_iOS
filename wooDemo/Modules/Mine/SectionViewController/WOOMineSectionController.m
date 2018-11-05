//
//  WOOMineSectionController.m
//  wooDemo
//
//  Created by colr on 2018/11/1.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOMineSectionController.h"

@interface WOOMineSectionController()<ASSectionController>

@end

@implementation WOOMineSectionController

- (void)didUpdateToObject:(id)object {
    
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return [ASIGListSectionControllerMethods sizeForItemAtIndex:index];
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    return [ASIGListSectionControllerMethods cellForItemAtIndex:index sectionController:self];
}

- (ASCellNodeBlock)nodeBlockForItemAtIndex:(NSInteger)index {
    return nil;
}

- (void)beginBatchFetchWithContext:(ASBatchContext *)context{
    
}

@end

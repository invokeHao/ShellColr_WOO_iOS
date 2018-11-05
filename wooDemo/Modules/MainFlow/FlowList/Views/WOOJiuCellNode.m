//
//  WOOJiuCellNode.m
//  wooDemo
//
//  Created by colr on 2018/11/5.
//  Copyright © 2018 colr. All rights reserved.
//

#import "WOOJiuCellNode.h"

@interface WOOJiuCellNode()

@property (nonatomic, strong)ASTextNode *titleNode;

@end

@implementation WOOJiuCellNode

- (void)setModel:(WOOJIuDemoModel *)model {
    if (model) {
        self.backgroundColor = [UIColor redColor];
        NSAttributedString * attStr = [self attributedStringWithString:model.title fontSize:15 color:[UIColor whiteColor] firstWordColor:[UIColor whiteColor]];
        self.titleNode.attributedText = attStr;
    }
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    return [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentCenter alignItems:ASStackLayoutAlignItemsCenter children:@[self.titleNode]];
}

- (ASTextNode *)titleNode {
    if (!_titleNode) {
        _titleNode = [[ASTextNode alloc]init];
    }
    return _titleNode;
}


- (NSAttributedString *)attributedStringWithString:(NSString *)string fontSize:(CGFloat)size
                                             color:(nullable UIColor *)color firstWordColor:(nullable UIColor *)firstWordColor
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    
    if (string) {
        NSDictionary *attributes                    = @{NSForegroundColorAttributeName: color ? : [UIColor blackColor],
                                                        NSFontAttributeName: [UIFont systemFontOfSize:size]};
        attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        [attributedString addAttributes:attributes range:NSMakeRange(0, string.length)];
        
        if (firstWordColor) {
            NSRange firstSpaceRange = [string rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
            NSRange firstWordRange  = NSMakeRange(0, firstSpaceRange.location);
            [attributedString addAttribute:NSForegroundColorAttributeName value:firstWordColor range:firstWordRange];
        }
    }
    
    return attributedString;
}


@end

//
//  AutoButtonView.m
//  App
//
//  Created by liujian on 15/12/16.
//  Copyright © 2015年 Chinamobo. All rights reserved.
//

#import "AutoButtonView.h"

@implementation AutoButtonView


-(void)startLayoutItem
{
    [super startLayoutItem];
    
    if (self.selectedItem.count) {
        for (UIButton *btn in self.subviews) {
            if ([self.selectedItem containsObject:[NSString stringWithFormat:@"%ld",btn.tag]]) {
                btn.selected = YES;
            }
        }
    }
}

-(void)resetAllButton
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            btn.selected = NO;
        }
    }
}

@end

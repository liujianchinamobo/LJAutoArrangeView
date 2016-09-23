
//
//  AutoArrangeView.m
//   按钮自动排列
//
//  Created by liujian on 15/5/15.
//  Copyright (c) 2015年 liujian. All rights reserved.
//

#import "AutoArrangeView.h"
#define HoraSpace 10 // 水平间距
#define VerticalSpace 10 // 竖直间距
#define ButtonHeight 20 // 按钮高度

@interface AutoArrangeView()
{
    
    UIButton *tempSelectButton;
}

@end

@implementation AutoArrangeView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _defaultTitleColor = [UIColor blackColor];
        _highlightTitleColor = [UIColor whiteColor];
        _selectedTitleColor = [UIColor redColor];
        _defaultBackgroundColor = [UIColor whiteColor];
        _font = [UIFont systemFontOfSize:12];
        _itemHeight = 20;
    }
    
    return self;
}

/**开始布局*/
-(void)startLayoutItem
{
//    NSAssert(_itemArray.count, @"itemArray数据源不能为空");
    
    if (!_itemArray.count) {
        return;
    }
    
    for (UIButton *btn in self.subviews) {
        [btn removeFromSuperview];
    }
        
    NSInteger sum = _itemArray.count; // 总数
    
    NSInteger rowcount = sum / _cloumCount; // 行数
    if (sum%_cloumCount) {
        rowcount += 1;
    }
    
    
    CGFloat screenWidth = self.bounds.size.width;
    // 按钮宽度
    CGFloat BtnWidth = (screenWidth - (_cloumCount+1) * HoraSpace)/_cloumCount;
    
    CGFloat BtnHeight = self.itemHeight?:ButtonHeight;
    
    // 布局
    for (int i = 0; i < rowcount; i ++) { // 行
        for (int j = 0; j < _cloumCount; j++)   // 列
        {
            // 不能超过数组的个数
            if (i*_cloumCount+j < sum) {
                
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                
                [btn setFrame:CGRectMake((HoraSpace+BtnWidth)*j+HoraSpace, (VerticalSpace+BtnHeight)*i+VerticalSpace, BtnWidth, BtnHeight)];
                
                btn.titleLabel.font = [UIFont systemFontOfSize:15];
                
                [btn setTitleColor:self.defaultTitleColor forState:UIControlStateNormal];
                [btn setTitleColor:self.highlightTitleColor forState:UIControlStateHighlighted];
                [btn setTitleColor:self.selectedTitleColor forState:UIControlStateSelected];
                
                [btn setBackgroundColor:self.defaultBackgroundColor];
            
                if (self.defaultBackgroundImage) {
                    [btn setBackgroundImage:self.defaultBackgroundImage forState:UIControlStateNormal];
                    [btn setBackgroundImage:self.defaultBackgroundImage forState:UIControlStateHighlighted];
                    [btn setBackgroundImage:self.defaultBackgroundImage forState:UIControlStateSelected];
                }
                
                if (self.highlightBackgroundImage) {
                     [btn setBackgroundImage:self.highlightBackgroundImage forState:UIControlStateHighlighted];
                }
                
                if (self.selectedBackgroundImage) {
                    [btn setBackgroundImage:self.selectedBackgroundImage forState:UIControlStateSelected];
                }
                
                btn.layer.cornerRadius = 10;
                
                if (self.font) {
                    btn.titleLabel.font = self.font;
                }
                NSInteger index = i*_cloumCount + j;
                btn.tag = index;
                [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
                
                NSString *title = _itemArray[btn.tag];
                
                [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
                
                [btn setTitle:title forState:UIControlStateNormal];
                
                if (self.defaultSelectedIndex) {
                    if (self.defaultSelectedIndex == index) {
                        btn.selected = YES;
                        [self clickAction:btn];
                    }
                }
                
                [self addSubview:btn];
            }
            
        }
    }
}

/**返回合适的高度*/
-(CGFloat)height
{
    NSInteger itemCount = _itemArray.count;
    // 行数
    NSInteger rowCoutn = itemCount / _cloumCount;
    if (itemCount%_cloumCount) {
        rowCoutn += 1;
    }
    
    CGFloat viewHeight = rowCoutn *(VerticalSpace + self.itemHeight?:ButtonHeight) + VerticalSpace;
    
    return viewHeight;
}

-(void)clickAction:(UIButton *)sender
{
    if ([tempSelectButton isEqual:sender] && tempSelectButton) {
        return;
    }
    
    tempSelectButton.selected = NO;
    tempSelectButton = sender;
    sender.selected = YES;
    
    if ([self.delegate respondsToSelector:@selector(AutoArrangeView:SelectButton:AtIndex:)]) {
        [self.delegate AutoArrangeView:self SelectButton:sender AtIndex:sender.tag];
    }
    
}

@end

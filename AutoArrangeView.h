//
//  AutoArrangeView.h
//   按钮自动排列
//
//  Created by liujian on 15/5/15.
//  Copyright (c) 2015年 liujian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AutoArrangeView;

/**点击按钮回调*/
@protocol AutoArrangeViewDelegate <NSObject>
@optional
- (void)AutoArrangeView:(AutoArrangeView *)view SelectButton:(UIButton *)btn AtIndex:(NSInteger)index;
@end


@interface AutoArrangeView : UIView
/** 列数*/
@property (nonatomic, assign) NSInteger cloumCount;
/** 数据源*/
@property (nonatomic, strong) NSArray *itemArray;
/**默认背景图*/
@property (nonatomic, strong) UIImage  * defaultBackgroundImage;
/** 高亮背景图*/
@property (nonatomic, strong) UIImage  * highlightBackgroundImage;
/** 选中背景图*/
@property (nonatomic, strong) UIImage  * selectedBackgroundImage;
/** 默认标题字体颜色*/
@property (nonatomic, strong) UIColor * defaultTitleColor;
/** 高亮标题字体颜色*/
@property (nonatomic, strong) UIColor * highlightTitleColor;
/**选中标题字体颜色*/
@property (nonatomic, strong) UIColor * selectedTitleColor;
/**默背景色*/
@property (nonatomic, strong) UIColor * defaultBackgroundColor;
/**按钮高度*/
@property (nonatomic, assign) CGFloat  itemHeight;
/** 标题字体*/
@property (nonatomic, strong) UIFont * font;
/** 代理*/
@property (nonatomic, strong) id<AutoArrangeViewDelegate> delegate;
/** 默认选中的index（0 代表没有选中，默认是第一个选中）*/
@property (nonatomic, assign) NSInteger  defaultSelectedIndex;
/**返回合适的view高度*/
@property (nonatomic, assign,readonly) CGFloat height;

/**开始布局，要在最后调用*/
-(void)startLayoutItem;

@end

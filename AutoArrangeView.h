//
//  AutoArrangeView.h
//   按钮自动排列
//
//  Created by liujian on 15/5/15.
//  Copyright (c) 2015年 liujian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AutoArrangeView;

/** 
 *
 * 一个用来布局的按钮，可以按照需要的几行几列来布局，并且可以高度自定义，
 *
 *
 */



/**点击按钮回调代理方法*/
@protocol AutoArrangeViewDelegate <NSObject>
@optional
/**点击按钮回调事件 */
- (void)AutoArrangeView:(AutoArrangeView *)view button:(UIButton *)btn atIndex:(NSInteger)index selected:(BOOL)selected;
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
@property (nonatomic, weak) id<AutoArrangeViewDelegate> delegate;
/** 默认选中的index*/
@property (nonatomic, assign) NSInteger  defaultSelectedIndex;
/**是否允许多选 默认不允许*/
@property (nonatomic, assign) BOOL  allowsMultipleSelection;
/**是否允许反选取消，默认不允许*/
@property (nonatomic, assign) BOOL  allowReverseSelection;
/**文字布局设置 */
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;
/**开始布局，要在上面的配置完后再来调用*/
-(void)startLayoutItem;
/**返回布局以后合适的view高度*/
@property (nonatomic, assign,readonly) CGFloat height;
@end

//
//  AutoButtonView.h
//  App
//
//  Created by liujian on 15/12/16.
//  Copyright © 2015年 Chinamobo. All rights reserved.
//

#import "AutoArrangeView.h"

/** 布局按钮的衍生类，可以设置初始哪些按钮是选中状态 */

@interface AutoButtonView : AutoArrangeView
/**默认已经选中的按钮*/
@property (nonatomic, strong) NSArray * selectedItem;
/**重置所有按钮状态*/
-(void)resetAllButton;
/**开始布局*/
-(void)startLayoutItem;
@end

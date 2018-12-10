//
//  CancelFloatView.h
//  WeChatFloatBall
//
//  Created by 惠上科技 on 2018/12/6.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CancelFloatView : UIView

/**
 是否正在显示，显示的时候背景为红色，否则为灰色
 */
- (void)setCancelFloatViewShowing:(BOOL)showing;

/**
 悬浮球是否进入右下角视图
 */
-(void)moveWithTouchInRound:(BOOL)touchInRound;

/**
 右滑手势拖动改变显示百分比
 */
-(void)showCancelFloatViewWithProgress:(CGFloat)progress completion:(void(^)(void))completion;

@end


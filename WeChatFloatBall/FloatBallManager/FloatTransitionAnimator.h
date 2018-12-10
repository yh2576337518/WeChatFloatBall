//
//  FloatTransitionAnimator.h
//  WeChatFloatBall
//
//  Created by 惠上科技 on 2018/12/6.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FloatTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

/**
 转场动画类型 push/pop
 */
@property (nonatomic, assign) UINavigationControllerOperation operation;

@property (nonatomic, strong) id<UIViewControllerContextTransitioning>transitionContext;

+ (instancetype)animatorWithStartCenter:(CGPoint)center radius:(CGFloat)radius operation:(UINavigationControllerOperation)operation;

-(instancetype)initWithStartCenter:(CGPoint)center radius:(CGFloat)radius operation:(UINavigationControllerOperation)operation;

/**
 替换新动画，用于手势拖动到某个位置，执行缩小动画
 */
- (void)replaceAnimation;

/**
 继续执行动画，用于控制交互转场，手势结束的动画执行
 */
- (void)continueAnimationWithFastSliding:(BOOL)fastSliding;

/**
 更新交互转场的进度
 */
- (void)updateInteractiveTransition:(CGFloat)percentComplete;

/**
 动画反转，用于手势拖动未达到pop条件时，将动画取消
 */
- (void)cancelInteractiveTransition;

@end


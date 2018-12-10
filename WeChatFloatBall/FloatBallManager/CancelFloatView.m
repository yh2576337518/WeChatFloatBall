//
//  CancelFloatView.m
//  WeChatFloatBall
//
//  Created by 惠上科技 on 2018/12/6.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import "CancelFloatView.h"
#import "UIView+FloatFrame.h"
#import "FloatBallDefine.h"
@interface CancelFloatView()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

/**
 模糊板
 */
@property (nonatomic, strong) UIToolbar *toolBar;

/**
 悬浮球是否拖动到圆内
 */
@property (nonatomic, assign) BOOL touchInRound;

/**
 是否正在显示，显示的时候背景为红色，否则为灰色
 */
@property (nonatomic, assign) BOOL showing;
@end

@implementation CancelFloatView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setupView];
    }
    return self;
}

-(void)setupView{
    _toolBar = [UIToolbar new];
    _toolBar.barStyle = UIBarStyleBlack;
    [self addSubview:_toolBar];
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"demo_cancel_float_default"]];
    _imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:_imageView];
    _label = [UILabel new];
    _label.font = [UIFont systemFontOfSize:10];
    _label.textColor = [UIColor colorWithHue:0 saturation:0 brightness:0.9 alpha:1.0];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"设置浮窗";
    [self addSubview:_label];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    _toolBar.frame = self.bounds;
    _imageView.size = CGSizeMake(40, 40);
    _imageView.centerX = self.width / 2.0 + 26;
    _imageView.centerY = self.height / 2.0;
    _label.size = CGSizeMake(self.width, 20);
    _label.centerX = _imageView.centerX;
    _label.y = CGRectGetMaxY(_imageView.frame) + 14;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGFloat radius = _touchInRound ? RoundViewRadius : RoundViewRadius - RoundViewOffset;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(RoundViewRadius, RoundViewRadius) radius:radius startAngle:M_PI endAngle:M_PI * 1.5 clockwise:1];
    [maskPath addLineToPoint:CGPointMake(RoundViewRadius, RoundViewRadius)];
    [maskPath addLineToPoint:CGPointMake(0, RoundViewRadius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

#pragma mark -----------Public

/**
 悬浮球是否进入右下角视图
 */
-(void)moveWithTouchInRound:(BOOL)touchInRound{
    if (_touchInRound != touchInRound) {
        _touchInRound = touchInRound;
        [self setNeedsDisplay];
        if (_touchInRound) {
            _imageView.image = [UIImage imageNamed:_showing?@"demo_cancel_float":@"demo_cancel_float_default2"];
        }else{
            _imageView.image = [UIImage imageNamed:_showing?@"demo_cancel_float":@"demo_cancel_float_default"];
        }
    }
}


/**
 视图显示百分比
 @param progress 百分比例
 @param completion 结果回调
 */
-(void)showCancelFloatViewWithProgress:(CGFloat)progress completion:(void (^)(void))completion{
    if (progress == 0) {
        //位移重置
        [UIView animateWithDuration:FloatTranslationOutDuration animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            FloatBlockExec(completion);
        }];
    }else{
        //位移动画
        self.transform = CGAffineTransformMakeTranslation(-RoundViewRadius * progress, -RoundViewRadius * progress);
    }
}


/**
 是否正在显示，显示的时候背景为红色，否则为灰色
 @param showing 是否显示状态
 */
-(void)setCancelFloatViewShowing:(BOOL)showing{
    if (_showing != showing) {
        _showing = showing;
        self.backgroundColor = showing ? [UIColor colorWithRed:0.9 green:0.3 blue:0.3 alpha:1.0] : [UIColor clearColor];
        _toolBar.hidden = showing;
        _imageView.image = [UIImage imageNamed:showing?@"demo_cancel_float":@"demo_cancel_float_default"];
        _label.text = showing?@"取消浮窗":@"设置浮窗";
    }
}

@end

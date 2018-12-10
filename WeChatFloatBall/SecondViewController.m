//
//  SecondViewController.m
//  WeChatFloatBall
//
//  Created by 惠上科技 on 2018/12/6.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+FloatFrame.h"
#import "ViewController.h"
@interface SecondViewController ()
@property (nonatomic, strong)UIButton *pushButton;
@end

@implementation SecondViewController
-(void)dealloc{
    NSLog(@"SecondViewController（测试页面） -- dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试页面";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pushButton];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.pushButton.size = CGSizeMake(100, 40);
    self.pushButton.center = self.view.center;
}

#pragma mark - getter
-(UIButton *)pushButton{
    if (!_pushButton) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_pushButton setTitle:@"跳转正常页面" forState:UIControlStateNormal];
        [_pushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_pushButton addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

-(void)pushAction:(id)sender{
    ViewController *vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

//
//  NSObject+ViewController.h
//  WeChatFloatBall
//
//  Created by 惠上科技 on 2018/12/6.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (ViewController)

+ (UIViewController *)currentViewController;
+ (UINavigationController *)currentNavigationController;
+ (UITabBarController *)currentTabBarController;

@end


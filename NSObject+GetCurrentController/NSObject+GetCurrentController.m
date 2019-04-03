//
//  NSObject+GetCurrentController.m
//  GetCurrentController
//
//  Created by 郑晗 on 2019/3/22.
//  Copyright © 2019年 郑晗. All rights reserved.
//

#import "NSObject+GetCurrentController.h"

@implementation NSObject (GetCurrentController)


- (UIViewController *)getCurrentViewController
{
    UIViewController *currentVC = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = nil;
    UIViewController *appRootVC = window.rootViewController;
    
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        
        currentVC = nav.childViewControllers.lastObject;
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        currentVC = nav.childViewControllers.lastObject;
    }else{
        currentVC = nextResponder;
    }
    return currentVC;
}

@end

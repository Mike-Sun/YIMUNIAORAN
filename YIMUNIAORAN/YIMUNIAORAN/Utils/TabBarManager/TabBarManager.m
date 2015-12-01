//
//  TabBarManager.m
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/27.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarManager.h"

@implementation TabBarManager

+ (void) removeTabBarInController:(UIViewController *)controller {
    [UIView animateWithDuration:0.2 animations:^{
        controller.tabBarController.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 49);
    }];
}

+ (void) showTabBarInController:(UIViewController *)controller {
    [UIView animateWithDuration:0.2 animations:^{
        controller.tabBarController.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    }];
}


@end

//
//  TabBarManager.h
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/27.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabBarManager : NSObject
+ (void) removeTabBarInController:(UIViewController *)controller;
+ (void) showTabBarInController:(UIViewController *)controller;
@end

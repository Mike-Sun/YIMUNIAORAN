//
//  AppDelegate.m
//  YIMUNIAORAN
//
//  Created by Michael Sun on 11/25/15.
//  Copyright © 2015 Michael Sun. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "CasesViewController.h"
#import "MasterViewController.h"
#import "PersonalViewController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) UILabel *homeBarLbl;
@property (nonatomic, strong) UILabel *caseBarLbl;
@property (nonatomic, strong) UILabel *masterBarLbl;
@property (nonatomic, strong) UILabel *personalBarLbl;

@end

@implementation AppDelegate


#pragma mark - app入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createInterface];
    
    
    return YES;
}

#pragma mark - 初始化界面
- (void)createInterface {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    // tabBarController
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    UIView *customTabBarView = [[UIView alloc] initWithFrame:self.tabBarController.tabBar.bounds];
    customTabBarView.backgroundColor = TABBAR_GRAY;
    [self.tabBarController.tabBar insertSubview:customTabBarView atIndex:0];
    self.tabBarController.tabBar.opaque = YES;
    
    // 4个Lbl
    self.homeBarLbl = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                0,
                                                                SCREEN_WIDTH / 4,
                                                                CGRectGetHeight(self.tabBarController.tabBar.frame))];
    self.homeBarLbl.text = @"首页";
    self.homeBarLbl.textColor = [UIColor whiteColor];
    self.homeBarLbl.font = [UIFont systemFontOfSize:16];
    self.homeBarLbl.textAlignment = NSTextAlignmentCenter;
    [customTabBarView addSubview:self.homeBarLbl];
    
    self.caseBarLbl = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 4,
                                                                0,
                                                                SCREEN_WIDTH / 4,
                                                                CGRectGetHeight(self.tabBarController.tabBar.frame))];
    self.caseBarLbl.text = @"案例分享";
    self.caseBarLbl.textColor = TABBARTEXT_GRAY;
    self.caseBarLbl.font = [UIFont systemFontOfSize:16];
    self.caseBarLbl.textAlignment = NSTextAlignmentCenter;
    [customTabBarView addSubview:self.caseBarLbl];
    
    
    self.masterBarLbl = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 4 * 2,
                                                                  0,
                                                                  SCREEN_WIDTH / 4,
                                                                  CGRectGetHeight(self.tabBarController.tabBar.frame))];
    self.masterBarLbl.text = @"设计师";
    self.masterBarLbl.textColor = TABBARTEXT_GRAY;
    self.masterBarLbl.font = [UIFont systemFontOfSize:16];
    self.masterBarLbl.textAlignment = NSTextAlignmentCenter;
    [customTabBarView addSubview:self.masterBarLbl];
    
    
    self.personalBarLbl = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 4 * 3,
                                                                    0,
                                                                    SCREEN_WIDTH / 4,
                                                                    CGRectGetHeight(self.tabBarController.tabBar.frame))];
    self.personalBarLbl.text = @"我的专属";
    self.personalBarLbl.textColor = TABBARTEXT_GRAY;
    self.personalBarLbl.font = [UIFont systemFontOfSize:16];
    self.personalBarLbl.textAlignment = NSTextAlignmentCenter;
    [customTabBarView addSubview:self.personalBarLbl];
    
    // 三条分割线
    UIView *aLine = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 4,
                                                             13,
                                                             1,
                                                             CGRectGetHeight(self.tabBarController.tabBar.frame) - 26)];
    aLine.backgroundColor = [UIColor whiteColor];
    aLine.alpha = 0.2;
    [customTabBarView addSubview:aLine];
    
    UIView *bLine = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 4 * 2,
                                                             13,
                                                             1,
                                                             CGRectGetHeight(self.tabBarController.tabBar.frame) - 26)];
    bLine.backgroundColor = [UIColor whiteColor];
    bLine.alpha = 0.2;
    [customTabBarView addSubview:bLine];
    
    UIView *cLine = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 4 * 3,
                                                             13,
                                                             1,
                                                             CGRectGetHeight(self.tabBarController.tabBar.frame) - 26)];
    cLine.backgroundColor = [UIColor whiteColor];
    cLine.alpha = 0.2;
    [customTabBarView addSubview:cLine];
    
    // 4个VC + 4个Nav
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    CasesViewController *caseVC = [[CasesViewController alloc] init];
    UINavigationController *caseNav = [[UINavigationController alloc] initWithRootViewController:caseVC];
    
    MasterViewController *masterVC = [[MasterViewController alloc] init];
    UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:masterVC];
    
    PersonalViewController *personalVC = [[PersonalViewController alloc] init];
    UINavigationController *personalNav = [[UINavigationController alloc] initWithRootViewController:personalVC];
    
    NSMutableArray *tabsArr = [NSMutableArray array];
    [tabsArr addObject:homeNav];
    [tabsArr addObject:caseNav];
    [tabsArr addObject:masterNav];
    [tabsArr addObject:personalNav];
    
    self.tabBarController.viewControllers = tabsArr;
    
    [self.window setRootViewController:self.tabBarController];
    
}

#pragma mark - tabBar选中协议方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    if (tabBarController.selectedIndex == 0) {
        NSLog(@"tabBar selected index == 0");
        self.homeBarLbl.textColor = [UIColor whiteColor];
        self.caseBarLbl.textColor = TABBARTEXT_GRAY;
        self.masterBarLbl.textColor = TABBARTEXT_GRAY;
        self.personalBarLbl.textColor = TABBARTEXT_GRAY;
        
    }else if (tabBarController.selectedIndex == 1) {
        NSLog(@"tabBar selected index == 1");
        self.homeBarLbl.textColor = TABBARTEXT_GRAY;
        self.caseBarLbl.textColor = [UIColor whiteColor];;
        self.masterBarLbl.textColor = TABBARTEXT_GRAY;
        self.personalBarLbl.textColor = TABBARTEXT_GRAY;
        
    }else if (tabBarController.selectedIndex == 2) {
        NSLog(@"tabBar selected index == 2");
        self.homeBarLbl.textColor = TABBARTEXT_GRAY;
        self.caseBarLbl.textColor = TABBARTEXT_GRAY;
        self.masterBarLbl.textColor = [UIColor whiteColor];;
        self.personalBarLbl.textColor = TABBARTEXT_GRAY;
        
    }else if (tabBarController.selectedIndex == 3) {
        NSLog(@"tabBar selected index == 3");
        self.homeBarLbl.textColor = TABBARTEXT_GRAY;
        self.caseBarLbl.textColor = TABBARTEXT_GRAY;
        self.masterBarLbl.textColor = TABBARTEXT_GRAY;
        self.personalBarLbl.textColor = [UIColor whiteColor];
    }
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

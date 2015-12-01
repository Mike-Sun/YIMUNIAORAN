//
//  BannerDetailViewController.m
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/27.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

#import "BannerDetailViewController.h"

@interface BannerDetailViewController ()

@end

@implementation BannerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createInterface];
    
}

- (void)viewWillAppear:(BOOL)animated {

    [TabBarManager removeTabBarInController:self];
    
}


- (void)viewDidAppear:(BOOL)animated {

    
}

- (void)viewWillDisappear:(BOOL)animated {

    [TabBarManager showTabBarInController:self];
    
}


- (void)viewDidDisappear:(BOOL)animated {

}

- (void)createInterface {
    
    self.view.backgroundColor = VCBACKGROUND_GRAY;
    
    // 自定义导航栏
    CustomNavBar *customNavBar = [[CustomNavBar alloc] init];
    [customNavBar NavView:self navText:@"轮播区详情" popState:1];
    [self.view addSubview:customNavBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

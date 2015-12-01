//
//  MasterViewController.m
//  YIMUNIAORAN
//
//  Created by Michael Sun on 11/26/15.
//  Copyright © 2015 Michael Sun. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createInterface];
}


- (void)createInterface {
    
    self.view.backgroundColor = VCBACKGROUND_GRAY;
    self.navigationController.navigationBar.hidden = YES;
    
    CustomNavBar *customNavBar = [[CustomNavBar alloc] init];
    [customNavBar NavView:self navText:@"软装大师" popState:1];
    customNavBar.backButton.hidden = YES;
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

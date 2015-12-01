//
//  CustomNavBar.m
//  SAYOGI
//
//  Created by  莲藕科技 on 15/10/31.
//  Copyright © 2015年  莲藕科技. All rights reserved.
//

#import "CustomNavBar.h"

@implementation CustomNavBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = TABBAR_GRAY;
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        self.navTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 44)];
        self.navTextLabel.text = self.titileText;
        self.navTextLabel.font = [UIFont systemFontOfSize:20];
        self.navTextLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.navTextLabel];
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.backButton.frame = CGRectMake(15,
                                           20 + ((64 - 20) / 2 - 28 / 2),
                                           28,
                                           28);
        [self.backButton setBackgroundImage:[UIImage imageNamed:@"left_arraw"] forState:UIControlStateNormal];
        [self.backButton addTarget:self action:@selector(backHome:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.backButton];
    }
    return self;
}

- (UIView *)NavView:(UIViewController *)controller navText:(NSString *)text popState:(NSInteger)state
{
    self.changeController = controller;
    self.state = state;
    self.navTextLabel.textColor = [UIColor whiteColor];
    self.navTextLabel.text = text;
    return (UIView *)self;
}


- (void)backHome:(id)sender
{
    if (self.state == 1) {
        [self.changeController.navigationController popViewControllerAnimated:YES];
    }else if(self.state == 2){
        [self.changeController.navigationController popToRootViewControllerAnimated:YES];
    }else
    {
        [self.changeController dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)title:(NSString *)title
{
    self.navTextLabel.textColor = [UIColor whiteColor];
    self.navTextLabel.text = title;
}

@end

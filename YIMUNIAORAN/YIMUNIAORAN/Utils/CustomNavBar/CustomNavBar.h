//
//  CustomNavBar.h
//  SAYOGI
//
//  Created by  莲藕科技 on 15/10/31.
//  Copyright © 2015年  莲藕科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavBar : UIView

@property (nonatomic, strong) UIViewController *changeController;
@property (nonatomic, strong) UILabel *navTextLabel;
@property (nonatomic, strong) NSString *titileText;
@property (nonatomic, strong) UIButton *backButton;
- (UIView *)NavView:(UIViewController *)controller navText:(NSString *)text popState:(NSInteger)state;
- (void)title:(NSString *)title;
@property (nonatomic, assign)NSInteger state;

@end

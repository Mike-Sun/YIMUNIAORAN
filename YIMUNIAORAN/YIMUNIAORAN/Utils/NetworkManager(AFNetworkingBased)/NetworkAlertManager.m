//
//  NetworkAlertManager.m
//  SAYOGI
//
//  Created by Michael Sun on 11/18/15.
//  Copyright © 2015  莲藕科技. All rights reserved.
//

#import "NetworkAlertManager.h"
#import <UIKit/UIKit.h>

@interface NetworkAlertManager ()<UIAlertViewDelegate>


@end

@implementation NetworkAlertManager

+ (void)showAlertWithMessage:(NSString *)message code:(NSInteger)code {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    alertView.tag = code;
    [alertView show];
    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        
        
        
    }
    
}



@end

//
//  NetworkAlertManager.h
//  SAYOGI
//
//  Created by Michael Sun on 11/18/15.
//  Copyright © 2015  莲藕科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkAlertManager : NSObject

+ (void)showAlertWithMessage:(NSString *)message code:(NSInteger)code;

@end
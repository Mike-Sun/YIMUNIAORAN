//
//  UserModel.m
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/27.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

#import "UserModel.h"

static UserModel *userModel = nil;

@implementation UserModel

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

#pragma mark - 取得UserModel单例
+ (UserModel *)getUserModel {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        if (!userModel) {
            userModel = [[UserModel alloc] init];
            userModel.accessToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"accessToken"];
            userModel.userId = [[NSUserDefaults standardUserDefaults] valueForKey:@"userId"];
            userModel.userName = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
            userModel.userCell = [[NSUserDefaults standardUserDefaults] valueForKey:@"userCell"];
            userModel.userPhotoUrl = [[NSUserDefaults standardUserDefaults] valueForKey:@"userPhotoUrl"];
            userModel.userGender = [[NSUserDefaults standardUserDefaults] valueForKey:@"userGender"];
            userModel.userAddress = [[NSUserDefaults standardUserDefaults] valueForKey:@"userAddress"];
        }
    });
    return userModel;
}

#pragma mark - 保存属性的改变到本地，一旦属性发生改变，则一定要调用此方法
- (void)saveChanges {
    
    [[NSUserDefaults standardUserDefaults] setValue:userModel.accessToken forKey:@"accessToken"];
    [[NSUserDefaults standardUserDefaults] setValue:userModel.userId forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults] setValue:userModel.userName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setValue:userModel.userCell forKey:@"userCell"];
    [[NSUserDefaults standardUserDefaults] setValue:userModel.userPhotoUrl forKey:@"userPhotoUrl"];
    [[NSUserDefaults standardUserDefaults] setValue:userModel.userGender forKey:@"userGender"];
    [[NSUserDefaults standardUserDefaults] setValue:userModel.userAddress forKey:@"userAddress"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"保存至Library路径：%@", LIBRARY_PATH);
}

#pragma mark - 清空本地数据（主要用于用户注销操作）
- (void)clearUserInfo {
    
    userModel.accessToken = @"";
    userModel.userId = @"";
    userModel.userName = @"";
    userModel.userCell = @"";
    userModel.userPhotoUrl = @"";
    userModel.userGender = @"";
    userModel.userAddress = [NSMutableDictionary dictionary];
    
    [userModel saveChanges];
}




@end

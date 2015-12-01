//
//  UserModel.h
//  YIMUNIAORAN
//
//  Created by Michael Sun (莲藕科技) on 15/11/27.
//  Copyright © 2015年 Michael Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic, strong) NSString     *accessToken;  // 访问令牌
@property (nonatomic, strong) NSString     *userId;       // 用户Id
@property (nonatomic, strong) NSString     *userName;     // 用户名
@property (nonatomic, strong) NSString     *userCell;     // 用户手机号
@property (nonatomic, strong) NSString     *userPhotoUrl; // 用户头像图片地址
@property (nonatomic, strong) NSString     *userGender;   // 用户性别
@property (nonatomic, strong) NSDictionary *userAddress;  // 用户地址

/**
 *  取得UserModel单例
 *
 */
+ (UserModel *)getUserModel;

/**
 *  保存属性的改变到本地，一旦属性发生改变，则一定要调用此方法
 */
- (void)saveChanges;

/**
 *  清空本地数据（主要用于用户注销操作）
 */
- (void)clearUserInfo;

@end

//
//  NetworkManager.h
//  SAYOOGI
//
//  Created by Michael Sun on 15/8/4.
//  Copyright (c) 2015年 Michael Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NetworkManager : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;  // 当前的网络请求manager
@property (nonatomic, strong) void(^finishedBlock)(NSDictionary *resultDict); // 请求成功block
@property (nonatomic, strong) void(^failedBlock)(NSError * error);     // 请求失败block

- (NSMutableDictionary *)baseParameterCreator;

- (void)GETConnectionWithUrl:(NSString *)url
                  parameters:(NSDictionary *)parameters
               finishedBlock:(void(^)(NSDictionary *resultDict))finishedBlock
                 failedBlock:(void(^)(NSError * error))failedBlock;

- (void)POSTConnectionWithUrl:(NSString *)url
                   parameters:(NSDictionary *)parameters
                finishedBlock:(void(^)(NSDictionary *resultDict))finishedBlock
                  failedBlock:(void(^)(NSError * error))failedBlock;

- (void)cancelNetworkRequest;

@end

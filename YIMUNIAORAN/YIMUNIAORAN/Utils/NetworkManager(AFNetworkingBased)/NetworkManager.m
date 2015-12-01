//
//  NetworkManager.m
//  SAYOOGI
//
//  Created by Michael Sun on 15/8/4.
//  Copyright (c) 2015年 Michael Sun. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NetworkManager

#pragma mark - 网络请求基本参数
- (NSMutableDictionary *)baseParameterCreator {
    NSMutableDictionary *baseParaDict = [NSMutableDictionary dictionary];
    [baseParaDict setObject:@"1113" forKey:@"clientId"];
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    long long int date = (long long int)time*1000;
    [baseParaDict setObject:[self sha1:[NSString stringWithFormat:@"%lld_%@",date, APIKEY]] forKey:@"sign"];
    [baseParaDict setObject:[NSString stringWithFormat:@"%lld",date] forKey:@"time"];
    return baseParaDict;
}

#pragma mark - SHA1加密
- (NSString *)sha1:(NSString *)inputStr {
    const char *cstr = [inputStr cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:inputStr.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *outputStr = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [outputStr appendFormat:@"%02x", digest[i]];
    }
    return outputStr;
}

#pragma mark - GET请求
- (void)GETConnectionWithUrl:(NSString *)url
                  parameters:(NSDictionary *)parameters
               finishedBlock:(void(^)(NSDictionary *resultDict))finishedBlock
                 failedBlock:(void (^)(NSError *))failedBlock{
    self.finishedBlock = finishedBlock;
    self.failedBlock = failedBlock;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    self.manager = manager;
    manager.requestSerializer.timeoutInterval = 8.f;
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =  [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, NSDictionary *resultDict) {
        NSLog(@"\n---------------↓↓↓---------------\n请求参数 == %@\n请求地址 == %@\n请求JSON == %@\n---------------↑↑↑---------------", parameters, operation.request.URL, resultDict);
        self.finishedBlock(resultDict);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"\n---------------↓↓↓---------------\n请求参数 == %@\n请求地址 == %@\nError == %@\n---------------↑↑↑---------------", parameters, error, operation.request.URL);
        self.failedBlock(error);
    }];
}

#pragma mark - POST请求
- (void)POSTConnectionWithUrl:(NSString *)url
                   parameters:(NSDictionary *)parameters
                finishedBlock:(void(^)(NSDictionary *resultDict))finishedBlock
                  failedBlock:(void(^)(NSError * error))failedBlock{
    self.finishedBlock = finishedBlock;
    self.failedBlock = failedBlock;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    self.manager = manager;
    manager.requestSerializer.timeoutInterval = 8.f;
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =  [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"\n---------------↓↓↓---------------\n请求参数 == %@\n请求地址 == %@\n请求JSON == %@\n---------------↑↑↑---------------", parameters, operation.request.URL, resultDict);
        self.finishedBlock(resultDict);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"\n---------------↓↓↓---------------\n请求参数 == %@\n请求地址 == %@\nError == %@\n---------------↑↑↑---------------", parameters, error, operation.request.URL);
        self.failedBlock(error);
    }];
}

#pragma mark - 取消网络请求
- (void)cancelNetworkRequest{
    [self.manager.operationQueue cancelAllOperations];
}


@end

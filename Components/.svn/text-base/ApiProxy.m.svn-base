//
//  ApiProxy.m
//  shengyin
//
//  Created by Andy on 15/8/1.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "ApiProxy.h"


@interface ApiProxy ()

@property (nonatomic, strong) NSMutableDictionary *dispatchTable;
@property (nonatomic, strong) NSNumber* recordedRqeustId;          // 请求id

// AFNetworking stuff
@property (nonatomic, strong) AFHTTPRequestOperationManager *operationManager;
@end

@implementation ApiProxy

#pragma -mark getters and setters
- (AFHTTPRequestOperationManager *)operationManager
{
    if (!_operationManager) {
        _operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:nil];
        _operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _operationManager;
}
- (NSMutableDictionary *)dispatchTable
{
    if (!_dispatchTable) {
        _dispatchTable = [[NSMutableDictionary alloc] init];
    }
    return _dispatchTable;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static ApiProxy *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ApiProxy alloc] init];
    });
    return sharedInstance;
}
- (NSInteger)callGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)name success:(XQSCallBack)success fail:(XQSCallBack)fail
{
    // 这边要
    NSURLRequest *request = [[RequestGenerator sharedInstance] generateGETRequestWithServiceIdentifier:servieIdentifier  RequestParams:params methodName:name];
    
    NSNumber *requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callPOSTWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(XQSCallBack)success fail:(XQSCallBack)fail
{
    NSURLRequest *request = [[RequestGenerator sharedInstance] generatePOSTRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    NSNumber *requestId = [self callApiWithRequest:request success:success fail:fail];
    return [requestId integerValue];
}



#pragma mark - private methods
// 对请求组件包装 同时生成requestId
- (NSNumber *) callApiWithRequest:(NSURLRequest *)request success:(XQSCallBack)success fail:(XQSCallBack)fail
{
    NSNumber *requestId = [self generateRequestId];
    
    AFHTTPRequestOperation *httpRequestOperation = [self.operationManager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {

        AFHTTPRequestOperation *storedoperation = self.dispatchTable[requestId];
        if (storedoperation == nil) {            // 当没有这个请求的时候 就抛弃
            NSLog(@"success ,but storedoperation nil");
            return;
        } else {
            [self.dispatchTable removeObjectForKey:requestId];
        }
        
        URLResponse *response = [[URLResponse alloc] initWithResponseString:operation.responseString
                                                                        requestId:requestId
                                                                          request:operation.request
                                                                     responseData:operation.responseData
                                                                           status:ResponseStatusSuccess];
        
        success?success(response):nil; // 这边判断block 是否为nil
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AFHTTPRequestOperation *storedoperation = self.dispatchTable[requestId];
        if (storedoperation == nil) {                   // 当没有这个请求的时候 就抛弃
            NSLog(@"fail ,but storedoperation nil");
            return;
        } else {
            [self.dispatchTable removeObjectForKey:requestId];
        }
        fail?fail(nil):nil; // 这边判断block 是否为nil
        
    }];
    
    // 将本次的请求放到dictionary中 来实现取消这个操作
    
    self.dispatchTable[requestId] = httpRequestOperation;
    [[self.operationManager operationQueue] addOperation:httpRequestOperation]; //这边可以做取消的处理
    return requestId;
}

- (void)cancelRequestWithRequestID:(NSNumber *)requestID
{
    NSOperation *requestOperation = self.dispatchTable[requestID];
    [requestOperation cancel];
    [self.dispatchTable removeObjectForKey:requestID];
}
- (void)cancelRequestWithRequestIDList:(NSArray *)requestList
{
    for (NSNumber *requestId in requestList) {
        [self cancelRequestWithRequestID:requestId];
    }
}

- (NSNumber *)generateRequestId
{
    if (_recordedRqeustId == nil) {
        _recordedRqeustId = @(1);
    } else {
        if ([_recordedRqeustId integerValue] == NSIntegerMax) {      // 太大了 就直接返回？
            _recordedRqeustId = @(1);
        } else {
            _recordedRqeustId = @([_recordedRqeustId integerValue] + 1 );
        }
    }
    return _recordedRqeustId;
}
@end

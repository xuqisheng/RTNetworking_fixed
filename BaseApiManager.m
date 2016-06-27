//
//  BaseApiManager.m
//  shengyin
//
//  Created by Andy on 15/8/1.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "BaseApiManager.h"
#import "URLResponse.h"
#import "AppContext.h"
#import "AndyNetworking.h"


#define XQSCallAPI(REQUEST_METHOD, REQUEST_ID) \
{\
    [[ApiProxy sharedInstance] call##REQUEST_METHOD##WithParams:params serviceIdentifier:self.child.serviceType methodName:self.child.methodName success:^(URLResponse *response) {\
        [self successedOnCallingAPI:response];\
    } fail:^(URLResponse *response) {\
        [self failedOnCallingAPI:response WithErrorType:BaseApiRequestErrorTypeDefault];\
    }];\
[self.requestIdList addObject:@(REQUEST_ID)];\
}

@interface BaseApiManager ()

@property (nonatomic, strong, readwrite) id fetchedRawData;

@property (nonatomic, copy, readwrite) NSString *errorMessage;
@property (nonatomic) BaseApiRequestErrorType errorType;
@property (nonatomic, strong) URLResponse* responseData;
@property (nonatomic, strong) NSMutableArray *requestIdList;
@end

@implementation BaseApiManager
#pragma -mark getters and setters

- (BOOL) isReachable
{
    BOOL isReachability = [AppContext sharedInstance].isReachable;
    if (!isReachability) {
        self.errorType = BaseApiRequestErrorTypeNoNetWork;
    }
    return isReachability;
}
- (NSMutableArray *)requestIdList
{
    if (!_requestIdList) {
        _requestIdList = [[NSMutableArray alloc] init];
    }
    return _requestIdList;
}
- (BOOL)isLoading
{
    return [self.requestIdList count] > 0 ? YES: NO;
}
#pragma -mark life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        _delegate = nil;
        _sourceData = nil;
        _fetchedRawData = nil;
        
        _errorMessage = nil;
        _errorType = BaseApiRequestErrorTypeDefault;
        
        
        if ([self conformsToProtocol:@protocol(APIManager)]) {
            self.child = (id <APIManager>)self;
        } else {
            NSAssert(NO, @"子类必须要实现APIManager这个protocol。");
        }
        
        if ([self conformsToProtocol:@protocol(APImanagerValidator)]) {
            self.validator = (id <APImanagerValidator>)self;
        } else {
            NSAssert(NO, @"子类必须要实现APImanagerValidator这个protocol。");
        }

    }
    return self;
}

- (void)dealloc
{
    
}
#pragma mark - public methods
- (void)cancelAllRequests
{
    
    [[ApiProxy sharedInstance] cancelRequestWithRequestIDList:self.requestIdList];
    [self.requestIdList removeAllObjects];
}

- (void)cancelRequestWithRequestId:(NSInteger)requestID
{
    [self removeRequestIDWithRequestID:requestID];      // 从自己中移除
    [[ApiProxy sharedInstance] cancelRequestWithRequestID:@(requestID)];
}

// 一定要给派生类自己内部 success后调用
- (id)fetchDataWithReformer:(id<BaseApiManagerCallbackReformer>)reformer
{
    id resultData = nil;
    if ([reformer respondsToSelector:@selector(manager:reformData:)]) {
        resultData = [reformer manager:self reformData:self.fetchedRawData];
    } else {
        resultData = [self.fetchedRawData mutableCopy];
    }
    return resultData;
}

- (NSInteger)loadData
{
    NSDictionary *params = [self.sourceData paramsForApi:self];
    NSInteger requestId = [self loadDataWithParams:params];
    return requestId;
}

- (NSInteger)loadDataWithParams:(NSDictionary *)params
{
    NSInteger requestId = 0;
    
    if ([self isReachable]) {
        if ([self.validator manager:self isCorrectWithParamsData:params]) {
            switch (self.child.requestType) {
                case BaseApiRequestRequestTypeGET:
                    XQSCallAPI(GET, requestId);
                    break;
                case BaseApiRequestRequestTypePost:
                    XQSCallAPI(POST, requestId);
                default:
                    break;
            }
            return requestId;
        } else {
            [self failedOnCallingAPI:nil WithErrorType:BaseApiRequestErrorTypeParamsError];
            return requestId;
        }
    } else {
        [self failedOnCallingAPI:nil WithErrorType:BaseApiRequestErrorTypeNoNetWork];  // 无网络
        return requestId;
    }
    return requestId;
}
#pragma mark -private methods
- (void)removeRequestIDWithRequestID:(NSInteger)requestId
{
    NSNumber *requestI2Remove = nil;
    for (NSNumber *storedRequestId in self.requestIdList) {
        if ([storedRequestId integerValue] == requestId) {
            requestI2Remove = storedRequestId;
        }
    }
    if (requestI2Remove) {
        [self.requestIdList removeObject:requestI2Remove];
    }
}

- (void)successedOnCallingAPI:(URLResponse *)response
{
    if (response.content) {
        self.fetchedRawData = [response.content copy];
    } else {
        self.fetchedRawData = [response.responseData copy];
    }
    [self removeRequestIDWithRequestID:response.requestId]; // 从这个request list中移除
    
    if ([self.validator manager:self isCorrectWithCallBackData:response.content]) {
        [self.delegate managerCallApiDidSuccess:self];
    } else {
        [self failedOnCallingAPI:response WithErrorType:BaseApiRequestErrorTypeNoContent];
    }
    
}

- (void)failedOnCallingAPI:(URLResponse *)response WithErrorType:(BaseApiRequestErrorType)errorType
{
    self.errorType = errorType;
    [self removeRequestIDWithRequestID:response.requestId];
    
    [self.delegate managerCallApiDidFailed:self];
    
}

@end

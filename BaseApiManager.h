//
//  BaseApiManager.h
//  shengyin
//
//  Created by Andy on 15/8/1.
//  Copyright (c) 2015年 Andy. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "URLResponse.h"

@class BaseApiManager;

typedef NS_ENUM(NSUInteger, BaseApiRequestErrorType){
    BaseApiRequestErrorTypeDefault,                     // 访问不到
    BaseApiRequestErrorTypeNoNetWork,                   // 没有网络
    BaseApiRequestErrorTypeParamsError,                 // 参数错误 (目前没有做验证
    BaseApiRequestErrorTypeNoContent                    // 没有内容
    
};
typedef NS_ENUM(NSUInteger, BaseApiRequestRequestType) {
    BaseApiRequestRequestTypeGET,
    BaseApiRequestRequestTypePost
};

//
@protocol BaseApiManagerCallBackDelegate<NSObject>
@required
- (void)managerCallApiDidSuccess:(BaseApiManager *)manager;
- (void)managerCallApiDidFailed:(BaseApiManager *)manager;
@end

@protocol BaseApiManagerParamsSouceDelegate <NSObject>
@required
- (NSDictionary *)paramsForApi:(BaseApiManager *)manager;
@end


// 当回调成功后 通过这个来获取到自己想要得到的格式的数据  这个协议 派生类要去实现吗
@protocol BaseApiManagerCallbackReformer <NSObject>
@required
- (id)manager:(BaseApiManager *)manager reformData:(NSDictionary *)data;
@end


// =========================================================================
/*
 APIManagerValidator
 */
@protocol APImanagerValidator <NSObject>
@required
- (BOOL)manager:(BaseApiManager *)manager isCorrectWithCallBackData:(NSDictionary *)data;
- (BOOL)manager:(BaseApiManager *)manager isCorrectWithParamsData:(NSDictionary *)data;
@end


// ==========================================================================
/*
 BaseApiManager的派生类必须符合这些protocal
 */
@protocol APIManager <NSObject>

@required
- (NSString *)methodName;                       // 然后派生类必须要有这些属性
- (NSString *)serviceType;
- (BaseApiRequestRequestType)requestType;
@end





// ==========================================================================
/*
 APIManagerInterceptor
 */
@protocol APIManagerInterceptor <NSObject>

@optional
- (void)manager:(BaseApiManager *)manager afterPerformSuccessWithResponse:(URLResponse *)response;

- (void)manager:(BaseApiManager *)manager afterPerformFailWithResponse:(URLResponse *)response;
@end


// ===========================================================================
@interface BaseApiManager : NSObject
@property (nonatomic, weak) id<BaseApiManagerCallBackDelegate> delegate;
@property (nonatomic, weak) id<BaseApiManagerParamsSouceDelegate> sourceData;
@property (nonatomic, weak) id<APImanagerValidator> validator;
@property (nonatomic, weak) NSObject<APIManager> *child; //里面会调用到NSObject的方法，所以这里不用id
/*
 baseManager是不会去设置errorMessage的，派生的子类manager可能需要给controller提供错误信息。所以为了统一外部调用的入口，设置了这个变量。
 派生的子类需要通过extension来在保证errorMessage在对外只读的情况下使派生的manager子类对errorMessage具有写权限。
 */
@property (nonatomic, copy, readonly) NSString *errorMessage;    // 暂时没有理解
@property (nonatomic, readonly) BaseApiRequestErrorType errorType;
@property (nonatomic, assign, readonly) BOOL isLoading; // 是否正在加载

- (id)fetchDataWithReformer:(id<BaseApiManagerCallbackReformer>)reformer; // 通过reformer来获取数据

- (NSInteger)loadData;

- (void)cancelAllRequests;
- (void)cancelRequestWithRequestId:(NSInteger)requestID;

@end

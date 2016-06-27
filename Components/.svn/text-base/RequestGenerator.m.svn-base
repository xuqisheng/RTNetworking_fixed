//
//  RequestGenerator.m
//  shengyin
//  根据调用的方法生成request
//  Created by andy on 15/8/5.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "RequestGenerator.h"
#import "NSURLRequest+AIFNetworkingMethods.h"
#import <AFNetworking/AFNetworking.h>

@interface RequestGenerator ()
@property (nonatomic, strong) AFHTTPRequestSerializer *httpRequestSerializer;
@property (nonatomic,strong) AFJSONRequestSerializer *jsonRequet;

@end


@implementation RequestGenerator
#pragma mark - getters and setters
- (AFHTTPRequestSerializer *)httpRequestSerializer
{
    if (!_httpRequestSerializer) {
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
        _httpRequestSerializer.timeoutInterval = 20.0f;
     
        _httpRequestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    }
    return _httpRequestSerializer;
}

+(instancetype)sharedInstance
{
    static RequestGenerator *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RequestGenerator alloc] init];
    });
    return sharedInstance;
}



// 派工 派工修改专用接口
- (NSURLRequest *)generateGETRequestWithServiceIdentifier:(NSString *)serviceIdentifier  RequestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    
    Service *service = [[ServiceFactory sharedInstance] serviceWithIndentifier:serviceIdentifier];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", service.apiBaseUrl, methodName];
    NSLog(@"RequestGenerator web url－> %@",urlString);
    self.jsonRequet = [AFJSONRequestSerializer serializer];
    self.jsonRequet.timeoutInterval = 20.0f;
//    NSString *jsonString = @"";
    NSDictionary *dic = nil;
    if (requestParams != nil) {
//        NSError *writeError = nil;
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestParams options:NSJSONWritingPrettyPrinted error:&writeError];
//        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        dic = [[NSDictionary alloc]initWithObjectsAndKeys:requestParams, @"data", nil];
    }
    NSURLRequest *request = [self.jsonRequet requestWithMethod:@"POST" URLString:urlString parameters:dic error:nil];
    
    
    request.requestParams = requestParams;
    return request;

}

- (NSURLRequest *)generatePOSTRequestWithServiceIdentifier:(NSString *)serviceIdentifier requestParams:(NSDictionary *)requestParams methodName:(NSString *)methodName
{
    Service *service = [[ServiceFactory sharedInstance] serviceWithIndentifier:serviceIdentifier];
    
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", service.apiBaseUrl, methodName];
    
    NSString *jsonString = @"";
    NSDictionary *dic = nil;
    if (requestParams != nil) {
        NSError *writeError = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestParams options:NSJSONWritingPrettyPrinted error:&writeError];
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        dic = [[NSDictionary alloc]initWithObjectsAndKeys:jsonString, @"data", nil];
    }
    
    NSURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"POST" URLString:urlString parameters:dic error:NULL];
    
    request.requestParams = requestParams;
    return request;
}



@end

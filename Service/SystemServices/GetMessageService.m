//
//  GetMessageService.m
//  KFT
//
//  Created by andy on 15/11/25.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "GetMessageService.h"

@implementation GetMessageService
- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@/repairs/customer" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
    
}
@end

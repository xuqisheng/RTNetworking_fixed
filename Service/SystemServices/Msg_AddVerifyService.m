//
//  Msg_AddVerifyService.m
//  KFT
//
//  Created by lijinghui on 15/12/23.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "Msg_AddVerifyService.h"

@implementation Msg_AddVerifyService
- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
}
@end

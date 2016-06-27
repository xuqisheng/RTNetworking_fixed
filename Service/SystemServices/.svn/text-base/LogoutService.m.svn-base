//
//  LogoutService.m
//  KFT
//
//  Created by tjq on 15/12/14.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "LogoutService.h"

@implementation LogoutService

- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
}

@end

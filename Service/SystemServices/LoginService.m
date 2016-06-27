//
//  Login.m
//  KFT
//
//  Created by tjq on 15/11/10.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService

- (NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    NSLog(@"ip %@", ipAddr);
    return ipAddr;
}

@end

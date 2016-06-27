//
//  SubCheckTaskService.m
//  KFT
//
//  Created by 林其铷 on 16/3/7.
//  Copyright © 2016年 foxhis. All rights reserved.
//

#import "SubCheckTaskService.h"

@implementation SubCheckTaskService
-(NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@/" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    NSLog(@"ip %@", ipAddr);
    return ipAddr;
    
}
@end

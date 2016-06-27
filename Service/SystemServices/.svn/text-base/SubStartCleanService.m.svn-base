//
//  SubStartCleanService.m
//  KFT
//
//  Created by 林其铷 on 16/2/26.
//  Copyright © 2016年 foxhis. All rights reserved.
//

#import "SubStartCleanService.h"

@implementation SubStartCleanService
-(NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    NSLog(@"ip %@", ipAddr);
    return ipAddr;
    
}
@end

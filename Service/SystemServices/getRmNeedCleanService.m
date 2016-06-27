//
//  getRmNeedCleanService.m
//  KFT
//
//  Created by 林其铷 on 15/11/13.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "getRmNeedCleanService.h"

@implementation getRmNeedCleanService

-(NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    NSLog(@"ip %@", ipAddr);
    return ipAddr;

}

@end

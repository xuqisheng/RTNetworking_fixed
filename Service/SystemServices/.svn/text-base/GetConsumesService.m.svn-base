//
//  GetConsumesService.m
//  KFT
//
//  Created by tjq on 16/3/7.
//  Copyright © 2016年 foxhis. All rights reserved.
//

#import "GetConsumesService.h"

@implementation GetConsumesService

-(NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    NSLog(@"ip %@", ipAddr);
    return ipAddr;
    
}

@end

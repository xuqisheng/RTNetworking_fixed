
//
//  RepairsPassService.m
//  KFT
//
//  Created by lijinghui on 15/11/19.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "RepairsPassService.h"

@implementation RepairsPassService
- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
}

@end

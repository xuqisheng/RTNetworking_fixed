//
//  ConsumeStatisticListService.m
//  KFT
//
//  Created by tjq on 15/11/24.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "ConsumeStatisticListService.h"

@implementation ConsumeStatisticListService

- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
}


@end

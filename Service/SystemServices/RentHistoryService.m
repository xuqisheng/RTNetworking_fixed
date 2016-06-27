//
//  RentHistoryService.m
//  KFT
//
//  Created by 庄忆 on 16/3/28.
//  Copyright © 2016年 foxhis. All rights reserved.
//

#import "RentHistoryService.h"

@implementation RentHistoryService
- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@/room/customer/" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
    
}

@end

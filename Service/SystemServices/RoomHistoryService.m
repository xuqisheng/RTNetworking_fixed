//
//  RoomHistoryService.m
//  KFT
//
//  Created by liucheng on 16/4/15.
//  Copyright © 2016年 foxhis. All rights reserved.
//

#import "RoomHistoryService.h"

@implementation RoomHistoryService
-(NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@/room/customer" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
    
}

@end

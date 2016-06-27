//
//  RoomLeaseService.m
//  KFT
//
//  Created by andy on 16/3/9.
//  Copyright © 2016年 foxhis. All rights reserved.
//

#import "RoomLeaseService.h"

@implementation RoomLeaseService
-(NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@/room/customer" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
    
}
@end

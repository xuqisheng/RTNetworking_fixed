//
//  GetRoomStatuService.m
//  KFT
//
//  Created by andy on 15/11/16.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "GetRoomStatuService.h"

@implementation GetRoomStatuService
- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@/room/customer" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
    
}
@end

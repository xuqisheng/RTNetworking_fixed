//
//  GetMsgHistoryService.m
//  KFT
//
//  Created by andy on 15/12/4.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "GetMsgHistoryService.h"

@implementation GetMsgHistoryService
- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@/room/customer" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
}
@end

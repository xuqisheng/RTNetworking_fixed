//
//  Msg_CheckService.m
//  KFT
//
//  Created by lijinghui on 15/11/29.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "Msg_CheckService.h"

@implementation Msg_CheckService
- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
}
@end

//
//  SyncDataService.m
//  KFT
//
//  Created by andy on 15/11/11.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "SyncDataService.h"

@implementation SyncDataService
- (NSString *)offlineApiBaseUrl
{

    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    NSLog(@"ip %@", ipAddr);
    return ipAddr;

}
@end

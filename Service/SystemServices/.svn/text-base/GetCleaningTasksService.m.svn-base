//
//  GetCleaningTasksService.m
//  KFT
//
//  Created by 林其铷 on 15/12/21.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "GetCleaningTasksService.h"

@implementation GetCleaningTasksService
-(NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    NSLog(@"ip %@", ipAddr);
    return ipAddr;
    
}
@end

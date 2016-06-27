//
//  DownLoadVicAndPicService.m
//  KFT
//
//  Created by tjq on 15/12/21.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "DownLoadVicAndPicService.h"

@implementation DownLoadVicAndPicService

- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
}

@end

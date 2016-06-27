//
//  SearchLeaveGoodsService.m
//  KFT
//
//  Created by lijinghui on 16/3/3.
//  Copyright © 2016年 foxhis. All rights reserved.
//

#import "SearchLeaveGoodsService.h"

@implementation SearchLeaveGoodsService
-(NSString *)offlineApiBaseUrl
{
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    NSLog(@"ip %@", ipAddr);
    return ipAddr;
    
}
@end

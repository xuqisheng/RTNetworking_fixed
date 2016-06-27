//
//  ExamineRepairsService.m
//  KFT
//
//  Created by andy on 15/12/6.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "ExamineRepairsService.h"

@implementation ExamineRepairsService
- (NSString *)offlineApiBaseUrl
{
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@:%@/%@/repairs/customer" ,[u valueForKey:kft_IP] ,[u valueForKey:kft_PORT] ,[u valueForKey:kft_PRONAME]];
    return ipAddr;
}
@end

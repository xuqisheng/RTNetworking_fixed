//
//  ActiveService.m
//  KFT
//
//  Created by lijinghui on 15/12/28.
//  Copyright © 2015年 foxhis. All rights reserved.
//

#import "ActiveService.h"

@implementation ActiveService

-(NSString *)offlineApiBaseUrl
{
    NSString *activeStr;
    
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    activeStr = [u valueForKey:kft_ActiveAddress];
    if (activeStr == nil) {
        activeStr = @"verify.foxhis.com:9877";
    }
    NSString *ipAddr = [NSString stringWithFormat:@"http://%@",activeStr];

    return ipAddr;
    
}
@end

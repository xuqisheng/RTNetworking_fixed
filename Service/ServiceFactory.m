//
//  ServiceFactory.m
//  shengyin
//
//  Created by andy on 15/8/26.
//  Copyright (c) 2015年 Andy. All rights reserved.
//

#import "ServiceFactory.h"
#import "getRmstaDiagramService.h"
#import "LoginService.h"
#import "SyncDataService.h"
#import "ChangeRoomStatusService.h"
#import "RoomRepairesItemsService.h"
#import "GetRoomInfoService.h"
#import "GetRoomStatuService.h"
#import "RoomRepaireService.h"
#import "MinibarHistoryService.h"
#import "RentHistoryService.h"
#import "PostMinibarService.h"
#import "ReportAndCheckService.h"
#import "ChangeToTempStatusService.h"
#import "DoLockRoomsService.h"
#import "DoUnLockRoomsService.h"
#import "AddRepairsService.h"
#import "RepairsAndQueryService.h"
#import "RepairsPassService.h"
#import "ConsumeStatisticListService.h"
#import "EquipmentStatisticListService.h"
#import "GetMessageService.h"
#import "RecevicedDetailsService.h"
#import "SavedDetailsService.h"
#import "Msg_CheckService.h"
#import "Msg_AuticheckService.h"
#import "Msg_RepairManService.h"
#import "Msg_AddDishpatchService.h"
#import "Msg_EditDishpatchService.h"
#import "ProcessSerMsgService.h"
#import "GetMsgHistoryService.h"
#import "ExamineRepairsService.h"
#import "ServiceChoiceReasonService.h"
#import "AspectMessService.h"
#import "LogoutService.h"
#import "EditRepairsService.h"
#import "DownLoadVicAndPicService.h"
#import "getRmNeedCleanService.h"
#import "SubmitCleaningResultService.h"
#import "RoomsNeedCleanInfoService.h"
#import "RoomsNeedCleanStausService.h"
#import "SubStartCleanService.h"
#import "SubCheckTaskService.h"
#import "GetCleaningTasksService.h"
#import "Msg_AddVerifyService.h"
#import "PassiveCheckRoomService.h"
#import "ActiveService.h"
#import "GetContractRoomsService.h"
#import "InputLeaveGoodsService.h"
#import "SearchLeaveGoodsService.h"
#import "OperateContractRoomService.h"
#import "SubmitConsumesService.h"
#import "GetConsumesService.h"
#import "DeleteConsumesService.h"
#import "RoomLeaseService.h"
#import "RoomHistoryService.h"

NSString * const ServiceGetRmStaDiagram = @"ServiceGetRmStaDiagram";
NSString * const ServiceLogin = @"ServiceLogin";
NSString * const ServiceSyncData = @"ServiceSyncData";
NSString * const ServiceRoomStatusDiagram = @"ServiceRoomStatusDiagram";
NSString * const ServiceChangeRoomStatus = @"ServiceChangeRoomStatus";
NSString * const ServiceRoomRepairesItems = @"ServiceRoomRepairesItems";
NSString * const ServiceGetRoomInfo = @"ServiceGetRoomInfo";
NSString * const ServiceGetRoomStatu = @"ServiceGetRoomStatu";
NSString * const ServiceRoomRepaire = @"ServiceRoomRepaire";
NSString * const ServiceMiniBarHistory = @"ServiceMiniBarHistory";
NSString * const ServiceRentHistory = @"ServiceRentHistory";
NSString * const ServicePostMiniBar = @"ServicePostMiniBar";
NSString * const ServiceReportAndCheck = @"ServiceReportAndCheck";
NSString * const ServiceChangeToTempStatus = @"ServiceChangeToTempStatus";
NSString * const ServiceDoLockRooms = @"ServiceDoLockRooms";
NSString * const ServiceDoUnLockRooms = @"ServiceDoUnLockRooms";
NSString * const ServiceAddRepairs = @"ServiceAddRepairs";
NSString * const ServiecRepairsAndQuery = @"ServiecRepairsAndQuery";
NSString * const ServicePassiveCheckRoom = @"ServicePassiveCheckRoom";
NSString * const ServiecRepairsPass = @"ServiecRepairsPass";
NSString * const ServiceConsumeStatisticList = @"ServiceConsumeStatisticList";
NSString * const ServiceEquipmentStatisticList = @"ServiceEquipmentStatisticList";
NSString * const ServiceGetMessage = @"ServiceGetMessage";
NSString * const ServiceRecevicedDetails = @"ServiceRecevicedDetails";
NSString * const ServiceSavedDetails = @"ServiceSavedDetails";
NSString * const ServiceMsg_Check = @"ServiceMsg_Check";
NSString * const ServiceMsg_Auticheck = @"ServiceMsg_Auticheck";
NSString * const ServiceMsg_RepairMan = @"ServiceMsg_RepairMan";
NSString * const ServiceMsg_AddDishpatch = @"ServiceMsg_AddDishpatch";
NSString * const ServiceMsg_EditDishpatch = @"ServiceMsg_EditDishpatch";
NSString * const ServiceProcessSerMsgService = @"ServiceProcessSerMsgService";
NSString * const ServiceGetMsgHistory = @"ServiceGetMsgHistory";
NSString * const ServiceExamineRepairs = @"ServiceExamineRepairs";
NSString * const ServiceAcceptServiceMsg= @"ServiceAcceptServiceMsg";
NSString * const ServiceChoiceReason = @"ServiceChoiceReason";
NSString * const ServiceLogout = @"ServiceLogout";
NSString * const ServiceEditRepairs = @"ServiceEditRepairs";
NSString * const ServiceDownLoadVicAndPic = @"ServiceDownLoadVicAndPic";
NSString * const ServiceGetRmNeedClean = @"SerViceGetRmNeedClean";
NSString * const ServiceSubmitCleaningResult = @"ServiceSubmitCleaningResult";
NSString * const ServiceRoomsNeedCleanInfo = @"ServiceRoomsNeedCleanInfo";
NSString * const ServiceRoomsNeedCleanStaus = @"ServiceRoomsNeedCleanStaus";
NSString * const ServiceGetCleaningTasks = @"ServiceGetCleaningTasks";
NSString * const ServiceStartClean = @"ServiceStartClean";//
NSString * const ServiceSubCheckTask = @"ServiceSubCheckTask";
NSString * const ServiceAddVerify = @"ServiceAddVerify";
NSString * const ServiceActive  = @"ServiceActive";
NSString * const ServiceGetContractRooms = @"ServiceGetContractRooms";
NSString * const ServiceInputLeaveGoods = @"ServiceInputLeaveGoods";
NSString * const ServiceSearchLeaveGoods = @"ServiceSearchLeaveGoods";
NSString * const ServiceOperateContractRoom = @"ServiceOperateContractRoom";
NSString * const ServiceSubmitConsumes = @"ServiceSubmitConsumes";
NSString * const ServiceGetConsumes = @"ServiceGetConsumes";
NSString * const ServiceDeleteConsumes = @"ServiceDeleteConsumes";
NSString * const ServiceRoomLeasePost = @"ServiceRoomLeasePost";
NSString * const ServiceRoomHistoryService = @"ServiceRoomHistoryService";

@interface ServiceFactory ()
@property (nonatomic, strong) NSMutableDictionary *serviceStorage;
@end

@implementation ServiceFactory

#pragma mark -getters and setters
- (NSMutableDictionary *)serviceStorage
{
    if (!_serviceStorage) {
        _serviceStorage = [[NSMutableDictionary alloc] init];
    }
    return _serviceStorage;
}
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static ServiceFactory *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ServiceFactory alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public methods
-(Service<ServiceProtocal> *)serviceWithIndentifier:(NSString *)indetifier
{
    if (self.serviceStorage[indetifier] == nil) {
        self.serviceStorage[indetifier] = [self newServiceWithidentifier:indetifier];
    }
    return self.serviceStorage[indetifier];
}

-(Service<ServiceProtocal> *)newServiceWithidentifier:(NSString *)indetifier
{
    if ([indetifier isEqualToString:ServiceGetRmStaDiagram]) {
        return [[getRmstaDiagramService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceLogin]) {
        return [[LoginService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceSyncData]) {
        return [[SyncDataService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceChangeRoomStatus]) {
        return [[ChangeRoomStatusService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceRoomRepairesItems]) {
        return [[RoomRepairesItemsService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceGetRoomInfo]) {
        return [[GetRoomInfoService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceGetRoomStatu]) {
        return [[GetRoomStatuService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceRoomRepaire]) {
        return [[RoomRepaireService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceMiniBarHistory]) {
        return [[MinibarHistoryService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceRentHistory]) {
        return [[RentHistoryService alloc] init];
    }
    if ([indetifier isEqualToString:ServicePostMiniBar]) {
        return [[PostMinibarService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceReportAndCheck]) {
        return [[ReportAndCheckService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceChangeToTempStatus]) {
        return [[ChangeRoomStatusService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceDoLockRooms]) {
        return [[DoLockRoomsService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceDoUnLockRooms]) {
        return [[DoUnLockRoomsService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceAddRepairs]) {
        return [[AddRepairsService alloc]init];
    }
    if ([indetifier isEqualToString:ServiecRepairsAndQuery]) {
        return [[RepairsAndQueryService alloc]init];
    }
    if ([indetifier isEqualToString:ServiecRepairsPass]) {
        return [[RepairsPassService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceConsumeStatisticList]) {
        return [[ConsumeStatisticListService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceEquipmentStatisticList]) {
        return [[EquipmentStatisticListService alloc]init];
    }
    if ([indetifier isEqualToString:ServiceGetMessage]) {
        return [[GetMessageService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceRecevicedDetails]) {
        return [[RecevicedDetailsService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceSavedDetails]) {
        return [[SavedDetailsService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceMsg_Check]) {
        return [[Msg_CheckService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceMsg_Auticheck]) {
        return [[Msg_AuticheckService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceMsg_RepairMan]) {
        return [[Msg_RepairManService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceMsg_AddDishpatch]) {
        return [[Msg_AddDishpatchService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceMsg_EditDishpatch]) {
        return [[Msg_EditDishpatchService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceProcessSerMsgService]) {
        return [[ProcessSerMsgService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceGetMsgHistory]) {
        return [[GetMsgHistoryService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceExamineRepairs]) {
        return [[ExamineRepairsService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceAcceptServiceMsg]) {
        return [[AspectMessService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceChoiceReason]) {
        return [[ServiceChoiceReasonService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceLogout]) {
        return [[LogoutService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceEditRepairs]) {
        return [[EditRepairsService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceGetRmNeedClean]) {
        return [[getRmNeedCleanService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceStartClean]) {
        return [[SubStartCleanService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceSubmitCleaningResult]) {
        return [[SubmitCleaningResultService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceSubCheckTask]) {
        return [[SubCheckTaskService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceRoomsNeedCleanInfo]) {
        return [[RoomsNeedCleanInfoService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceDownLoadVicAndPic]) {
        return [[DownLoadVicAndPicService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceRoomsNeedCleanStaus]) {
        return [[RoomsNeedCleanStausService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceGetCleaningTasks]) {
        return [[GetCleaningTasksService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceAddVerify]) {
        return [[Msg_AddVerifyService alloc] init];
    }
    if ([indetifier isEqualToString:ServicePassiveCheckRoom]) {
        return [[PassiveCheckRoomService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceActive]) {
        return [[ActiveService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceGetContractRooms]) {
        return [[GetContractRoomsService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceInputLeaveGoods]) {
        return [[InputLeaveGoodsService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceSearchLeaveGoods]) {
        return [[SearchLeaveGoodsService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceOperateContractRoom]) {
        return [[OperateContractRoomService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceSubmitConsumes]) {
        return [[SubmitConsumesService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceGetConsumes]) {
        return [[GetConsumesService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceDeleteConsumes]) {
        return [[DeleteConsumesService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceRoomLeasePost]) {
        return [[RoomLeaseService alloc] init];
    }
    if ([indetifier isEqualToString:ServiceRoomHistoryService]) {
        return [[RoomHistoryService alloc] init];
    }
    return nil;
}

@end

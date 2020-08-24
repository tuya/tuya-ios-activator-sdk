//
//  TuyaSmartHome+Invitation.h
//  TuyaSmartDeviceKit
//
//  Created by Hemin Won on 2020/4/15.
//

#import <TuyaSmartDeviceKit/TuyaSmartDeviceKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TuyaSmartHomeAddMemberRequestModel;
@interface TuyaSmartHome (Invitation)

/// 邀请码方式邀请新成员 invitation code invite home member
/// @param success 成功回调 success
/// @param failure 失败回调 failure
- (void)createInvitationWithSuccess:(void(^)(TuyaSmartHomeInvitationResultModel *invitationResultModel))success
                            failure:(TYFailureError)failure;

/// 获取邀请记录列表信息 fetch invitation record list
/// @param success 成功回调 success
/// @param failure 失败回调 failure
- (void)fetchInvitationRecordListWithSuccess:(void(^)(NSArray<TuyaSmartHomeInvitationRecordModel *> *invitationRecordList))success
                                     failure:(TYFailureError)failure;

@end

NS_ASSUME_NONNULL_END

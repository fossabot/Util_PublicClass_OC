//
//  HSPublicFunc.h
//  HSRongyiBao
//
//  Created by hoomsun on 2016/12/29.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSPublicFunc : NSObject

// 通讯录是否授权
@property (nonatomic, assign) BOOL contactAuthoried;

+ (BOOL)contactAuthoried;
/// 判断通讯录权限，如果没有授权则弹出alertView提示用户跳转至授权界面
+ (BOOL)contactAuthoriedAndShowAlert;

/// 获取通讯录保存在沙盒中的路径
- (void)fetchContactPath;

/// 上传通讯录
+ (void)uploadContacts;

/// 提示框 - 打开定位
+ (void)showAlertRequiredToLocate;

/// 判断INS_CURRENTSTATUS表示在流程的第几步
- (NSInteger)workflowPositionWithCurrentStatus:(NSString *)currentStatus;

///// 获取指定的ViewControllerClass数组
//+ (NSArray<Class> *)viewControllerClassArray;
//
///// 获取指定的ViewControllerClass数组（首页、个人中心首页）
//+ (NSArray<Class> *)mainViewControllerClassArray;


#pragma mark 是否实名认证
+ (BOOL)isRealName;


#pragma mark 拨打电话
+ (void)callWithPhoneNumber:(NSString *)phone;

#pragma mark 根据银行名称查找app中的银行logo
/// 根据银行名称查找app中的银行logo
+ (NSString *)findBankLogoNameWithBankName:(NSString *)bankName;
/// 根据银行名称查找app中收款账户对应的银行logo
+ (NSString *)findPaymentAccountNameWith:(NSString *)bankName;
/// 根据银行名称查找app中认证银行卡对应的银行logo
+ (NSString *)findBankAuthNameWith:(NSString *)bankName;

@end

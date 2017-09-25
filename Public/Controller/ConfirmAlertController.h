//
//  ConfirmAlertController.h
//  HSRongyiBao
//
//  Created by hoomsun on 2016/12/28.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmAlertController : UIAlertController


/**
 显示从底部弹出的ActionSheet

 @param title 标题
 @param message 信息
 @param confirmTitle 确定按钮文字
 @param cancelTitle 取消按钮文字
 @param viewController 要显示弹框的viewController
 @param actionBlock 按钮回调
 */
+ (void)actionSheetWithTitle:(NSString * __nullable)title
                     message:(NSString * __nullable)message
                confirmTitle:(NSString * __nullable)confirmTitle
                 cancelTitle:(NSString * __nullable)cancelTitle
                 actionStyle:(UIAlertActionStyle)actionStyle
              viewController:(UIViewController * __nonnull)viewController
                 actionBlock:(void(^ __nullable)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction))actionBlock;

/**
 显示界面中间弹出的提示框
 
 @param title 标题
 @param message 信息
 @param confirmTitle 确定按钮文字
 @param cancelTitle 取消按钮文字
 @param viewController 要显示弹框的viewController
 @param actionBlock 按钮回调
 */
+ (void)showAlertWithTitle:(NSString * __nullable)title
                   message:(NSString * __nullable)message
              confirmTitle:(NSString * __nullable)confirmTitle
               cancelTitle:(NSString * __nullable)cancelTitle
               actionStyle:(UIAlertActionStyle)actionStyle
            viewController:(UIViewController * __nonnull)viewController
               actionBlock:(void(^ __nullable)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction))actionBlock;


/**
 显示界面中间弹出的提示框，多个“确定按钮”和1个“取消按钮”
 
 @param title 标题
 @param message 信息
 @param confirmTitles 确定按钮组的文字
 @param cancelTitle 取消按钮文字
 @param viewController 要显示弹框的viewController
 @param actionBlock 按钮回调
 */
+ (void)showAlertWithTitle:(NSString * __nullable)title
                   message:(NSString * __nullable)message
             confirmTitles:(NSArray<NSString *> * __nullable)confirmTitles
               cancelTitle:(NSString * __nullable)cancelTitle
               actionStyle:(UIAlertActionStyle)actionStyle
            viewController:(UIViewController * __nonnull)viewController
               actionBlock:(void(^ __nullable)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction))actionBlock;

/**
 显示界面中间弹出的提示框(1个按钮)
 
 @param title 标题
 @param message 信息
 @param confirmTitle 确定按钮文字
 @param viewController 要显示弹框的viewController
 @param actionBlock 按钮回调
 */
+ (void)showOneButtonAlertWithTitle:(NSString * __nullable)title
                            message:(NSString * __nullable)message
                       confirmTitle:(NSString * __nullable)confirmTitle
                        actionStyle:(UIAlertActionStyle)actionStyle
                     viewController:(UIViewController * __nonnull)viewController
                        actionBlock:(void(^ __nullable)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction))actionBlock;

@end

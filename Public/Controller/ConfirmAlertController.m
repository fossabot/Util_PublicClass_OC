//
//  ConfirmAlertController.m
//  HSRongyiBao
//
//  Created by hoomsun on 2016/12/28.
//  Copyright © 2016年 hoomsun. All rights reserved.
//

#import "ConfirmAlertController.h"

@interface ConfirmAlertController ()

@property (nonatomic, copy) void(^ __nullable actionBlock)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction);

@end



@implementation ConfirmAlertController

- (void)viewDidLoad {
    [super viewDidLoad];

}

/// 显示ActionSheet
+ (void)actionSheetWithTitle:(NSString * __nullable)title
                     message:(NSString * __nullable)message
                confirmTitle:(NSString * __nullable)confirmTitle
                 cancelTitle:(NSString * __nullable)cancelTitle
                 actionStyle:(UIAlertActionStyle)actionStyle
              viewController:(UIViewController * __nonnull)viewController
                 actionBlock:(void(^ __nullable)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction))actionBlock {
    
    __weak typeof(viewController) weakVC = viewController;
    ConfirmAlertController *alertViewController = [[ConfirmAlertController alloc] initWithTitle:title message:message buttonCount:2 confirmTitles:confirmTitle ? @[confirmTitle] : @[@"确定"] cancelTitle:cancelTitle style:UIAlertControllerStyleActionSheet actionStyle:actionStyle viewController:viewController actionBlock:actionBlock];
    [weakVC presentViewController:alertViewController animated:YES completion:nil];
}


/**
 显示界面中间弹出的提示框
 */
+ (void)showAlertWithTitle:(NSString * __nullable)title
                   message:(NSString * __nullable)message
              confirmTitle:(NSString * __nullable)confirmTitle
               cancelTitle:(NSString * __nullable)cancelTitle
               actionStyle:(UIAlertActionStyle)actionStyle
            viewController:(UIViewController * __nonnull)viewController
               actionBlock:(void(^ __nullable)(NSInteger confirmIndexn, UIAlertAction * __nullable cancelAction))actionBlock {
    
    __weak typeof(viewController) weakVC = viewController;
    ConfirmAlertController *alertViewController = [[ConfirmAlertController alloc] initWithTitle:title message:message buttonCount:2 confirmTitles:confirmTitle ? @[confirmTitle] : @[@"确定"] cancelTitle:cancelTitle style:UIAlertControllerStyleAlert actionStyle:actionStyle  viewController:viewController actionBlock:actionBlock];
    [weakVC presentViewController:alertViewController animated:YES completion:nil];
}

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
               actionBlock:(void(^ __nullable)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction))actionBlock{
    
    __weak typeof(viewController) weakVC = viewController;
    ConfirmAlertController *alertViewController = [[ConfirmAlertController alloc] initWithTitle:title message:message buttonCount:confirmTitles.count+1 confirmTitles:confirmTitles cancelTitle:cancelTitle style:UIAlertControllerStyleAlert actionStyle:actionStyle  viewController:viewController actionBlock:actionBlock];
    [weakVC presentViewController:alertViewController animated:YES completion:nil];
}



/**
 显示界面中间弹出的提示框(1个按钮)
 只有确定按钮有回调
 */
+ (void)showOneButtonAlertWithTitle:(NSString * __nullable)title
                            message:(NSString * __nullable)message
                       confirmTitle:(NSString * __nullable)confirmTitle
                        actionStyle:(UIAlertActionStyle)actionStyle
                     viewController:(UIViewController * __nonnull)viewController
                        actionBlock:(void(^ __nullable)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction))actionBlock {
    
    __weak typeof(viewController) weakVC = viewController;
    ConfirmAlertController *alertViewController = [[ConfirmAlertController alloc] initWithTitle:title message:message buttonCount:1 confirmTitles:@[confirmTitle] cancelTitle:nil style:UIAlertControllerStyleAlert actionStyle:actionStyle  viewController:viewController actionBlock:actionBlock];
    [weakVC presentViewController:alertViewController animated:YES completion:nil];
}



#pragma mark - Initializer

- (instancetype)initWithTitle:(NSString * __nullable)title
                      message:(NSString * __nullable)message
                  buttonCount:(NSInteger)buttonCount
                confirmTitles:(NSArray<NSString *> * __nullable)confirmTitles
                  cancelTitle:(NSString * __nullable)cancelTitle
                        style:(UIAlertControllerStyle)style
                  actionStyle:(UIAlertActionStyle)actionStyle
               viewController:(UIViewController * __nonnull)viewController
                  actionBlock:(void(^ __nullable)(NSInteger confirmIndex, UIAlertAction * __nullable cancelAction))actionBlock {
    self = [super init];
    if (self) {
        ConfirmAlertController *alertController = [ConfirmAlertController alertControllerWithTitle:title message:message preferredStyle:style];
        self = alertController;
        self.title = title;
        self.message = message;
        self.actionBlock = actionBlock;
        
        __weak typeof(alertController) weakAlertController = alertController;
        
        // 取消按钮
        if (buttonCount > 1) {
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancelTitle ? cancelTitle : @"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                weakAlertController.actionBlock(-1, action);
            }];
            [alertController addAction:cancel];
        }
        
        for (int i=0; i<confirmTitles.count; i++) {
            NSString *confirmTitle = confirmTitles[i];
            // 确认按钮
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:confirmTitle style:actionStyle handler:^(UIAlertAction * _Nonnull action) {
                weakAlertController.actionBlock(i, nil);
            }];
            [alertController addAction:confirm];
        }
    }
    return self;
}



#pragma mark - 内存警告

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

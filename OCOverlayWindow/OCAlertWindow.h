//
//  OCAlertWindow.h
//  OCOverlayWindow
//
//  Created by vvveiii on 2019/6/17.
//  Copyright © 2019 lvv. All rights reserved.
//

#import "OCOverlayWindow.h"

@interface OCAlertWindow : OCOverlayWindow

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *message;
@property(nonatomic, copy, readonly) NSArray<UITextField *> *textFields;

+ (instancetype)windowWithTitle:(NSString *)title message:(NSString *)message;

- (void)addAction:(UIAlertAction *)action;

- (void)addPreferredAction:(UIAlertAction *)action NS_AVAILABLE_IOS(9_0);

- (void)addPreferredActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler NS_AVAILABLE_IOS(9_0);

- (void)addDefaultActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;

- (void)addCancelActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;

- (void)addDestructiveActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;

- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler;

@end

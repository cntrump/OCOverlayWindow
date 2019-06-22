//
//  OCAlertWindow.m
//  OCOverlayWindow
//
//  Created by vvveiii on 2019/6/17.
//  Copyright © 2019 lvv. All rights reserved.
//

#import "OCAlertWindow.h"
#import "AlertContainerController.h"

@interface OCAlertWindow ()

@end

@implementation OCAlertWindow

+ (Class)rootViewControllerClass {
    return AlertContainerController.class;
}

+ (instancetype)windowWithTitle:(NSString *)title message:(NSString *)message {
    return [[self alloc] initWithTitle:title message:message];
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    if (self = [super initWithFrame:CGRectZero]) {
        self.title = title.copy;
        self.message = message.copy;
    }

    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title.copy;
    ((AlertContainerController *)self.rootViewController).alertTitle = title;
}

- (void)setMessage:(NSString *)message {
    _message = message.copy;
    ((AlertContainerController *)self.rootViewController).alertMessage = message;
}

- (NSArray<UITextField *> *)textFields {
    return ((AlertContainerController *)self.rootViewController).alertTextFields;
}

- (void)show {
    [super show];

    [(AlertContainerController *)self.rootViewController show];
}

- (void)addAction:(UIAlertAction *)action {
    [(AlertContainerController *)self.rootViewController addAction:action];
}

- (void)addPreferredAction:(UIAlertAction *)action NS_AVAILABLE_IOS(9_0) {
    [(AlertContainerController *)self.rootViewController addPreferredAction:action];
}

- (void)addPreferredActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler NS_AVAILABLE_IOS(9_0) {
    [(AlertContainerController *)self.rootViewController addPreferredActionWithTitle:title handler:handler];
}

- (void)addDefaultActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    [(AlertContainerController *)self.rootViewController addDefaultActionWithTitle:title handler:handler];
}

- (void)addCancelActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    [(AlertContainerController *)self.rootViewController addCancelActionWithTitle:title handler:handler];
}

- (void)addDestructiveActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
    [(AlertContainerController *)self.rootViewController addDestructiveActionWithTitle:title handler:handler];
}

- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler {
    [(AlertContainerController *)self.rootViewController addTextFieldWithConfigurationHandler:configurationHandler];
}

@end

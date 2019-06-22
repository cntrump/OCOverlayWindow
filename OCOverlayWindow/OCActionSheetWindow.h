//
//  OCActionSheetWindow.h
//  OCOverlayWindow
//
//  Created by vvveiii on 2019/6/17.
//  Copyright © 2019 lvv. All rights reserved.
//

#import "OCOverlayWindow.h"

@interface OCActionSheetWindow : OCOverlayWindow

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *message;

+ (instancetype)windowWithTitle:(NSString *)title message:(NSString *)message;

- (void)addAction:(UIAlertAction *)action;

- (void)addDefaultActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;

- (void)addCancelActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;

- (void)addDestructiveActionWithTitle:(NSString *)title handler:(void (^)(UIAlertAction *action))handler;

@end

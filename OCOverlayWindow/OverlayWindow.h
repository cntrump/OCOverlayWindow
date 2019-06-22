//
//  OverlayWindow.h
//  OCOverlayWindow
//
//  Created by vvveiii on 2019/6/17.
//  Copyright © 2019 lvv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCOverlayWindow : UIWindow

+ (instancetype)window;

- (void)show;

- (void)showAllowKeyboard;

- (void)destory;

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;

@end

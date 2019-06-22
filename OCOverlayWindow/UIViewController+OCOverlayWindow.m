//
//  UIViewController+OCOverlayWindow.m
//  OCOverlayWindow
//
//  Created by vvveiii on 2019/6/17.
//  Copyright © 2019 lvv. All rights reserved.
//

#import "UIViewController+OCOverlayWindow.h"

@implementation UIViewController (OCOverlayWindow)

- (UIStatusBarStyle)oc_topPreferredStatusBarStyle {
    BOOL isNav = [self isKindOfClass:UINavigationController.class];
    BOOL isTab = [self isKindOfClass:UITabBarController.class];

    if (!isNav && !isTab && !self.presentedViewController) {
        return self.preferredStatusBarStyle;
    }

    UIStatusBarStyle style = UIStatusBarStyleDefault;
    if (self.presentedViewController) {
        style = self.presentedViewController.oc_topPreferredStatusBarStyle;
    } else if (isTab) {
        style = ((UITabBarController *)self).selectedViewController.oc_topPreferredStatusBarStyle;
    } else if (isNav) {
        style = ((UINavigationController *)self).topViewController.oc_topPreferredStatusBarStyle;
    }

    return style;
}

@end

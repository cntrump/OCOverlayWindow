//
//  OverlayViewController.m
//  OCOverlayWindow
//
//  Created by vvveiii on 2019/6/17.
//  Copyright © 2019 lvv. All rights reserved.
//

#import "OverlayViewController.h"
#import "UIViewController+OCOverlayWindow.h"

@interface OverlayViewController ()

@end

@implementation OverlayViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (!self.mainWindow.rootViewController) {
        return UIStatusBarStyleDefault;
    }

    return self.mainWindow.rootViewController.oc_topPreferredStatusBarStyle;
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    __weak typeof(self) wself = self;
    [super dismissViewControllerAnimated:flag completion:^{
        if (completion) {
            completion();
        }

        if (!wself.presentedViewController) {
            [wself.rootWindow destory];
        }
    }];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    UIInterfaceOrientationMask defaultOrientations = UIInterfaceOrientationMaskPortrait;

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        defaultOrientations = UIInterfaceOrientationMaskAll;
    }

    if (!self.presentedViewController) {
        return defaultOrientations;
    }

    if (self.presentedViewController.isBeingDismissed || self.presentedViewController.isBeingPresented) {
        return defaultOrientations;
    }

    return self.presentedViewController.supportedInterfaceOrientations;
}

@end

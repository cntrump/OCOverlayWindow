//
//  OverlayWindow.m
//  OCOverlayWindow
//
//  Created by vvveiii on 2019/6/17.
//  Copyright © 2019 lvv. All rights reserved.
//

#import "OverlayWindow.h"
#import "OverlayViewController.h"

@interface OCOverlayWindow () {
    UIWindowLevel _innerWindowLevel;
}

@end

@implementation OCOverlayWindow

+ (Class)rootViewControllerClass {
    return OverlayViewController.class;
}

+ (instancetype)window {
    return [[self alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _innerWindowLevel = (UIWindowLevel)10000002;
        self.rootViewController = [[self.class.rootViewControllerClass alloc] init];
    }

    return self;
}

- (UIWindowLevel)windowLevel {
    return _innerWindowLevel;
}

- (void)setWindowLevel:(UIWindowLevel)windowLevel {
    _innerWindowLevel = windowLevel;
    super.windowLevel = windowLevel;
}

- (UIWindow *)mainWindow {
    return UIApplication.sharedApplication.delegate.window;
}

- (void)destory {
    self.hidden = YES;
    ((OverlayViewController *)self.rootViewController).rootWindow = nil;
    [self.mainWindow makeKeyWindow];
}

- (void)show {
    [self showWithLvel:self.windowLevel];
}

- (void)showAllowKeyboard {
    [self showWithLvel:(UIWindowLevel)10000000];
}

- (void)showWithLvel:(UIWindowLevel)level {
    if (!self.isHidden || !self.mainWindow) {
        return;
    }

    OverlayViewController *rootVC = (OverlayViewController *)self.rootViewController;
    rootVC.mainWindow = self.mainWindow;
    rootVC.rootWindow = self;
    rootVC.view.backgroundColor = UIColor.clearColor;

    self.backgroundColor = UIColor.clearColor;
    self.frame = self.mainWindow.frame;
    self.windowLevel = level;
    [self makeKeyAndVisible];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (!self.hidden || !self.mainWindow || self.rootViewController.presentedViewController) {
        return;
    }

    if (@available(iOS 9.0, *)) {

    }

    [self show];

    __weak typeof(self) wself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
        [wself.rootViewController presentViewController:viewControllerToPresent animated:flag completion:completion];
    });
}

@end

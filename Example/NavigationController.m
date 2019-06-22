//
//  NavigationController.m
//  Example
//
//  Created by vvveiii on 2019/6/22.
//  Copyright © 2019 lvv. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

@end

//
//  OverlayViewController.h
//  OCOverlayWindow
//
//  Created by vvveiii on 2019/6/17.
//  Copyright © 2019 lvv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverlayWindow.h"

@interface OverlayViewController : UIViewController

@property(nonatomic, weak) UIWindow *mainWindow;
@property(nonatomic, weak) OCOverlayWindow *rootWindow;

@end

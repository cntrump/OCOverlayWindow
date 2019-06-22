//
//  ViewController.m
//  Example
//
//  Created by vvveiii on 2019/6/22.
//  Copyright © 2019 lvv. All rights reserved.
//

#import "ViewController.h"
@import OCOverlayWindow;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItems = @[
                                                [[UIBarButtonItem alloc] initWithTitle:@"alert" style:UIBarButtonItemStylePlain target:self action:@selector(alert:)],
                                                [[UIBarButtonItem alloc] initWithTitle:@"sheet" style:UIBarButtonItemStylePlain target:self action:@selector(sheet:)]
                                                ];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)alert:(id)sender {
    OCAlertWindow *alert = [OCAlertWindow windowWithTitle:@"alert" message:@"test"];
    [alert addDefaultActionWithTitle:@"1" handler:nil];
    [alert addPreferredActionWithTitle:@"2" handler:nil];
    [alert show];
}

- (void)sheet:(id)sender {
    OCActionSheetWindow *sheet = [OCActionSheetWindow windowWithTitle:@"sheet" message:@"test"];
    [sheet addDestructiveActionWithTitle:@"3" handler:nil];
    [sheet addDefaultActionWithTitle:@"1" handler:nil];
    [sheet addCancelActionWithTitle:@"2" handler:nil];
    [sheet show];
}

@end

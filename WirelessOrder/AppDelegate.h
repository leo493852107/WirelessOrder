//
//  AppDelegate.h
//  WirelessOrder
//
//  Created by leo on 15/9/13.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterViewController.h"
#import "DetailViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic, strong) UISplitViewController *splitVC;

@property (nonatomic, strong) MaterViewController *master;
@property (nonatomic, strong) DetailViewController *detail;

@end


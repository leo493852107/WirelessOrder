//
//  MaterViewController.h
//  WirelessOrder
//
//  Created by leo on 15/9/13.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"
#import "TableView.h"
#import "PayView.h"
#import "SyncDataView.h"
#import "SettingView.h"

#import "DetailViewController.h"

@interface MaterViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MenuView *menuView;
@property (nonatomic, strong) TableView *tableView;
@property (nonatomic, strong) PayView *payView;
@property (nonatomic, strong) SyncDataView *syncDataView;
@property (nonatomic, strong) SettingView *settingView;

@property (nonatomic, strong) DetailViewController *detail;

@end

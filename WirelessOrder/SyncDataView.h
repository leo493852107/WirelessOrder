//
//  SyncDataView.h
//  WirelessOrder
//
//  Created by leo on 15/9/13.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuManager.h"

@interface SyncDataView : UIView <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, strong) UITableView *tv;

@property (nonatomic, strong) MenuManager *menuManager;

@end

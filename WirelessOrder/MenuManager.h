//
//  MenuManager.h
//  WirelessOrder
//
//  Created by leo on 15/9/14.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBUtil.h"

@interface MenuManager : NSObject

@property (nonatomic, strong) DBUtil *util;

//1 同步菜单
- (void)syncMenu;

//2 同步菜单分类
- (void)syncMenuType;

@end

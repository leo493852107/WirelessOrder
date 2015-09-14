//
//  Menu.h
//  WirelessOrder
//
//  Created by leo on 15/9/14.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BmobSDK/Bmob.h>

@interface Menu : BmobObject

@property (nonatomic, copy) NSString *objectid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) float price;

@property (nonatomic, copy) NSString *tid;
@property (nonatomic, copy) NSString *picture_path;
@property (nonatomic, copy) NSString *desc;

@end

//
//  main.m
//  WirelessOrder
//
//  Created by leo on 15/9/13.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *appKey = @"e22f1be95ee7577e4618ada4ef4638ad";
        [Bmob registerWithAppKey:appKey];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

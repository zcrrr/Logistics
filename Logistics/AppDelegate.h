//
//  AppDelegate.h
//  Logistics
//
//  Created by zc on 14-11-5.
//  Copyright (c) 2014年 张 驰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NetworkHandler;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController* mainNavi;

@property (strong, nonatomic) NetworkHandler* networkHandler;


+ (AppDelegate*)getApplicationDelegate;
@end


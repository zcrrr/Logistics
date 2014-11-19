//
//  MainViewController.m
//  Logistics
//
//  Created by zc on 14-11-5.
//  Copyright (c) 2014年 张 驰. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "NetworkHandler.h"
#import "ZCUtil.h"
#define kApp [AppDelegate getApplicationDelegate]

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    NSMutableDictionary* params = [[NSMutableDictionary alloc]init];
//    [params setObject:@"10101010101" forKey:@"goodsid"];
//    [params setObject:@"张驰" forKey:@"name"];
//    [params setObject:@"2" forKey:@"role"];
//    [params setObject:@"安华桥" forKey:@"address"];
//    [params setObject:@"安华桥第一仓库" forKey:@"housename"];
//    [params setObject:@"" forKey:@"carcode"];
//    [params setObject:@"zcrrr" forKey:@"username"];
//    [params setObject:@"3" forKey:@"action"];
//    [params setObject:@"121.22222" forKey:@"lon"];
//    [params setObject:@"39.334343" forKey:@"lat"];
//    [params setObject:[NSString stringWithFormat:@"%llu",[ZCUtil nowTimeStamp_millisecond]] forKey:@"actiontime"];
//    [kApp.networkHandler doPostRequest:@"goods/save" :params];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

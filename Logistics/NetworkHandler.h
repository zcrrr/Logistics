//
//  NetworkHandler.h
//  Logistics
//
//  Created by zc on 14-11-5.
//  Copyright (c) 2014年 张 驰. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASINetworkQueue;
@class ASIFormDataRequest;

@protocol savegoodsDelegate <NSObject>
//上报货物最新信息流
- (void)verifyCodeDidSuccess:(NSDictionary*)resultDic;
- (void)verifyCodeDidFailed:(NSString*)mes;
@end

@interface NetworkHandler : NSObject

@property (nonatomic, strong) ASINetworkQueue* networkQueue;

- (void)startQueue;

//定义每个请求的delegate
@property (nonatomic, strong) id<savegoodsDelegate> delegate_savegoods;

//定义每个请求的request
@property (nonatomic, strong) ASIFormDataRequest* savegoodsRequest;

- (void)doPostRequest:(NSString*)requestType :(NSMutableDictionary*)params;

@end

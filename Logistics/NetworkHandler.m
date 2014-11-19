//
//  NetworkHandler.m
//  Logistics
//
//  Created by zc on 14-11-5.
//  Copyright (c) 2014年 张 驰. All rights reserved.
//

#import "NetworkHandler.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#define ENDPOINTS @"http://115.28.211.59:28081/bbtruck/"
#define TAG_SAVE_GOODS 1

@implementation NetworkHandler

@synthesize networkQueue;

@synthesize delegate_savegoods;

@synthesize savegoodsRequest;



- (void)startQueue{
    //    self.handler = self;//持有自己的引用，这样就不会被释放,在delegate里面有了强引用，这里可以注释了
    [self setNetworkQueue:[ASINetworkQueue queue]];
    [[self networkQueue] setDelegate:self];
    [[self networkQueue] setRequestDidFinishSelector:@selector(requestFinishedByQueue:)];
    [[self networkQueue] setRequestDidFailSelector:@selector(requestFailedByQueue:)];
    [[self networkQueue] setQueueDidFinishSelector:@selector(queueFinished:)];
    [[self networkQueue] setShouldCancelAllRequestsOnFailure:NO ];//取消一个请求不会取消队列中的所有请求
    [self networkQueue].maxConcurrentOperationCount = 3;//同时最多进行3个请求
    [[self networkQueue] go];
}
#pragma mark -NetworkQueue
- (void)requestFinishedByQueue:(ASIHTTPRequest *)request{
    NSString *responseString = [[NSString alloc] initWithData:[request responseData] encoding:NSUTF8StringEncoding];
    NSLog(@"---服务器返回结果是%@",responseString);
}
- (void)requestFailedByQueue:(ASIHTTPRequest *)request{
}
- (void)queueFinished:(ASIHTTPRequest *)request{
    NSLog(@"queueFinished");
}


- (void)doPostRequest:(NSString*)requestType :(NSMutableDictionary*)params{
    NSString* str_url = [NSString stringWithFormat:@"%@%@",ENDPOINTS,requestType];
    NSURL* url = [NSURL URLWithString:str_url];
    self.savegoodsRequest =  [ASIFormDataRequest requestWithURL:url];
    self.savegoodsRequest.tag = TAG_SAVE_GOODS;
    [self.savegoodsRequest setNumberOfTimesToRetryOnTimeout:3];
    [self.savegoodsRequest setTimeOutSeconds:15];
//    [self.savegoodsRequest addRequestHeader:@"X-PID" value:kApp.pid];
//    [self.savegoodsRequest addRequestHeader:@"ua" value:kApp.ua];
    for (id oneKey in [params allKeys]){
        [self.savegoodsRequest setPostValue:[params objectForKey:oneKey] forKey:oneKey];
    }
    NSLog(@"保存货物信息url:%@",str_url);
    NSLog(@"保存货物信息参数:%@",params);
    [[self networkQueue]addOperation:self.savegoodsRequest];
}

@end

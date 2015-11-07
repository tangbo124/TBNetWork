//
//  BannerRequestAPI.m
//  TBNetWork
//
//  Created by tangbo on 15/11/7.
//  Copyright © 2015年 chebanma. All rights reserved.
//

#import "BannerRequestAPI.h"

@implementation BannerRequestAPI
- (TBRequestMethod)requestMethod {
    return TBRequestMethodGet;
}

- (NSDictionary *)requestArgument {
    return @{@"appVersion": @(1),
             @"appId": @(888888)};
}

- (NSString *)requestUrl {
    return @"bg/buss/getBannerList.do";
//    return @"http://service.dddata.com.cn/bg/buss/getBannerList.do";
}

//http://service.dddata.com.cn/bg/buss/getBannerList.do?appVersion=1.0.0&appId=888888
@end

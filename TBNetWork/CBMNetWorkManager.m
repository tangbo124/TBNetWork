//
//  CBMNetWorkManager.m
//  TBNetWork
//
//  Created by tangbo on 15/11/7.
//  Copyright © 2015年 chebanma. All rights reserved.
//

#import "CBMNetWorkManager.h"
#import "TBNetWorkClient.h"
#import "BannerRequestAPI.h"

@implementation CBMNetWorkManager

+ (instancetype)defaultManager {
    static dispatch_once_t once;
    static CBMNetWorkManager *manager = nil;
    dispatch_once(&once, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [TBNetWorkClient defaultClient].baseUrl = @"http://service.dddata.com.cn";
        [TBNetWorkClient defaultClient].optionParam = @{@"aaaaa": @(11111)};
    }
    return self;
}

- (void)requestBannerWithBlock:(void (^)(id, NSError *))block {
    BannerRequestAPI *request = [BannerRequestAPI new];
    [[TBNetWorkClient defaultClient] requestJsonDataWithRequestAPI:request success:^(id data) {
        NSLog(@"%@", data);
        block(data, nil);
    } failure:^(id data, NSError *error) {
        NSLog(@"%@", error);
        block(nil, error);
    }];
}

@end

//
//  CBMNetWorkManager.h
//  TBNetWork
//
//  Created by tangbo on 15/11/7.
//  Copyright © 2015年 chebanma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BannerRequestAPI.h"

@interface CBMNetWorkManager : NSObject
+ (instancetype)defaultManager;
- (void)requestBannerWithBlock: (void(^)(id, NSError *))block;
@end

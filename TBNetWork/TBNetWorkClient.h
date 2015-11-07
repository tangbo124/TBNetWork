//
//  TBNetWorkClient.h
//  TBNetWork
//
//  Created by tangbo on 15/11/7.
//  Copyright © 2015年 chebanma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBRequestAPIDelegate.h"
@interface TBNetWorkClient : NSObject
@property (nonatomic, copy) NSString *baseUrl;///< 根url
@property (nonatomic, copy) NSDictionary *optionParam;///< 可选参数
+ (instancetype)defaultClient;
/**
 *  带请求类的网络请求
 *
 *  @param requestAPI 请求类, 必须实现TBRequestAPIDelegate
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
- (void)requestJsonDataWithRequestAPI: (id<TBRequestAPIDelegate>)requestAPI success: (void(^)(id data))success failure: (void(^)(id data, NSError *error))failure;
/**
 *  直接传参数和url的请求
 *
 *  @param method  请求类型
 *  @param url     请求url
 *  @param param   请求参数
 *  @param success 请求成功回调
 *  @param failure 请求失败回调
 */
- (void)requestJsonDataWithMethod: (NSString *)method URL: (NSString *)url param: (id)param success: (void(^)(id data))success failure: (void(^)(id data, NSError *error))failure;
@end

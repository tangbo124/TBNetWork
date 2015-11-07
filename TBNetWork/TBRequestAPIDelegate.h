//
//  RequestAPIDelegate.h
//  TBNetWork
//
//  Created by tangbo on 15/11/7.
//  Copyright © 2015年 chebanma. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  请求类型
 */
typedef NS_ENUM(NSInteger, TBRequestMethod){
    /**
     *  get请求, 默认
     */
    TBRequestMethodGet = 0,
    /**
     *  post请求
     */
    TBRequestMethodPost,
    /**
     *  put请求
     */
    TBRequestMethodPut,
    /**
     *  delete请求
     */
    TBRequestMethodDelete,
    /**
     *  head请求
     */
    TBRequestMethodHead,
    /**
     *  patch请求
     */
    TBRequestMethodPatch
};
@protocol TBRequestAPIDelegate <NSObject>
/**
 *  请求类型, 子类需继承
 *
 *  @return 请求类型
 */
- (TBRequestMethod)requestMethod;

/**
 *  网络请求参数, 子类需继承
 *
 *  @return 请求参数, 返回类型一般是字典
 */
- (NSDictionary *)requestArgument;

/**
 *  网络请求的url
 *
 *  @return 网络请求的url
 */
- (NSString *)requestUrl;
@end

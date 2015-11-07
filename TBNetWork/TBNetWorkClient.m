//
//  TBNetWorkClient.m
//  TBNetWork
//
//  Created by tangbo on 15/11/7.
//  Copyright © 2015年 chebanma. All rights reserved.
//

#import "TBNetWorkClient.h"
#import "AFNetworking.h"

@interface TBNetWorkClient ()
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@end

@implementation TBNetWorkClient
+ (instancetype)defaultClient {
    static dispatch_once_t once;
    static TBNetWorkClient *instance;
    dispatch_once(&once, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (void)requestJsonDataWithRequestAPI: (id<TBRequestAPIDelegate>)requestAPI success: (void(^)(id data))success failure: (void(^)(id data, NSError *error))failure {
    NSURLRequest *request = [self generateRequestWithRequestAPI:requestAPI];
    [self requestJsonWithRequest:request success:success failure:failure];
}

- (void)requestJsonDataWithMethod: (NSString *)method URL: (NSString *)url param: (id)param success: (void(^)(id data))success failure: (void(^)(id data, NSError *error))failure {
    NSLog(@"request url: %@, param: %@", url, param);
    NSError *error = nil;
    NSMutableURLRequest *methodRequest = [self.manager.requestSerializer requestWithMethod:method URLString:url parameters:param error:&error];
    if (error) {
        NSLog(@"创建reqeust失败");
        return;
    }
    [self requestJsonWithRequest:methodRequest success:success failure:failure];
}

- (void)requestJsonWithRequest: (NSURLRequest *)request success: (void(^)(id data))success failure: (void(^)(id data, NSError *error))failure {
    AFHTTPRequestOperation *operation = [self.manager HTTPRequestOperationWithRequest:(NSURLRequest *)request success:^(AFHTTPRequestOperation * operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        failure(operation.responseObject, error);
    }];
    [self.manager.operationQueue addOperation:operation];
}

- (NSMutableURLRequest *)generateRequestWithRequestAPI:(id<TBRequestAPIDelegate>)requestAPI
{
    TBRequestMethod method = [requestAPI requestMethod];
    NSString *requestUrl = [requestAPI requestUrl];
    NSDictionary *param = [requestAPI requestArgument];
    NSString *methodStr = @"GET";
    switch (method) {
        case TBRequestMethodGet:
            methodStr = @"GET";
            break;
        case TBRequestMethodPost:
            methodStr = @"POST";
            break;
        case TBRequestMethodPut:
            methodStr = @"PUT";
            break;
        case TBRequestMethodDelete:
            methodStr = @"DELETE";
            break;
        case TBRequestMethodHead:
            methodStr = @"HEAD";
            break;
        case TBRequestMethodPatch:
            methodStr = @"PATCH";
            break;
        default:
            break;
    }
    
    NSError *error = nil;
    
    if (self.baseUrl) {
        requestUrl = [NSString stringWithFormat:@"%@/%@", self.baseUrl, requestUrl];
    }
    
    if (self.optionParam) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:param];
        for (id key in self.optionParam) {
            [dic setObject:self.optionParam[key] forKey:key];
        }
        param = [NSDictionary dictionaryWithDictionary:dic];
    }
    
    NSLog(@"request url: %@, param: %@", requestUrl, param);
    
    NSMutableURLRequest *methodRequest = [self.manager.requestSerializer requestWithMethod:methodStr URLString:requestUrl parameters:param error:&error];
    if (error) {
        NSLog(@"创建reqeust失败");
        return nil;
    }
    return methodRequest;
}

#pragma mark - get方法
- (AFHTTPRequestOperationManager *)manager {
    if (!_manager) {
        _manager = ({
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
//            [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//            manager.securityPolicy.allowInvalidCertificates = YES;
            manager;
        });
    }
    return _manager;
}
@end

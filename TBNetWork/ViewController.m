//
//  ViewController.m
//  TBNetWork
//
//  Created by tangbo on 15/11/7.
//  Copyright © 2015年 chebanma. All rights reserved.
//

#import "ViewController.h"
#import "CBMNetWorkManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[CBMNetWorkManager defaultManager] requestBannerWithBlock:^(id data, NSError *error) {
        NSLog(@"%@", data);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

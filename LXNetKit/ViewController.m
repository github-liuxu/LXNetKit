//
//  ViewController.m
//  LXNetKit
//
//  Created by leyikao on 15/8/29.
//  Copyright (c) 2015年 leyikao. All rights reserved.
//

#import "ViewController.h"
#import "LXNetKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *para = @{@"courseName":@"行测",@"pageNumber":@"1",@"userId":@"a3fdb3ef-4c5a-11e5-80b5-4e1069dd1bee"};
    [LXNetKit sendAsynchronousUrlString:@"http://223.202.119.245:8083/serviceapp/rs/qaService/problemList" HTTPMethod:@"POST" param:para complate:^(NSURLResponse *response, NSString *result) {
        NSLog(@"-----%@",result);
    } field:^(NSURLResponse *response, NSError *connectionError) {
        NSLog(@"=======%@",connectionError);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

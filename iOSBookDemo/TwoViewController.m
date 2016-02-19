//
//  TwoViewController.m
//  iOSBookDemo
//
//  Created by lianghailiang on 15/12/22.
//  Copyright © 2015年 jinvovo_ios. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()<UIScrollViewDelegate>

@end

@implementation TwoViewController

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x == scrollView.contentSize.width-scrollView.frame.size.width) {
        [scrollView setContentOffset:CGPointMake(0, 0)];
    }
    
    _pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestHttpTest];
}

#pragma mark ----------------

- (void)requestHttpTest{

    NSURL *URL = [NSURL URLWithString:@"http://echosystem.kibey.com/sound/hot?page=1"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON:%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"ERROR:%@",error);
    }];
    
}

@end

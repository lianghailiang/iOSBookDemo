//
//  ThreeViewController.m
//  iOSBookDemo
//
//  Created by lianghailiang on 16/2/17.
//  Copyright © 2016年 jinvovo_ios. All rights reserved.
//

#import "ThreeViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSObjDelegate <JSExport>

JSExportAs(Click666, - (void)click:(NSString *)str);//设置别名

@end

@interface ThreeViewController ()<JSObjDelegate,UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@property (nonatomic, strong) JSContext *jsContext;

@end

@implementation ThreeViewController

- (void)click:(NSString *)str{
    NSLog(@"web返回 %@",str);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myWebView setDelegate:self];
        
    NSURL *url = [[NSURL alloc] initFileURLWithPath:@"/Users/lianghailiang/Desktop/Com/iOSBookDemo/iOSBookDemo/test.html"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.jsContext = [self.myWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"dowinFundCallback"] = self;
}

@end

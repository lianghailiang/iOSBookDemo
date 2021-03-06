//
//  ViewController.m
//  iOSBookDemo
//
//  Created by lianghailiang on 15/12/15.
//  Copyright © 2015年 jinvovo_ios. All rights reserved.
//

#import "OneViewController.h"
#import <AFNetworking.h>
#import <YYKit.h>
#import "MBProgressHUD.h"
#import <pop/POP.h>
#import "IssueAnimation.h"

@interface OneViewController (){
    UIView *lView;
    UIView *blurView;
}

@property (nonatomic ,strong) IssueAnimation *issueAnimation;

@end

@implementation OneViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark 发布动画
- (IBAction)d:(id)sender {
    if (!_issueAnimation) {
        _issueAnimation = [[IssueAnimation alloc] init];
    }
    [_issueAnimation d:nil];
}

- (void)loadingView{
    lView = [[UIView alloc] init];
    [lView setSize:CGSizeMake(100, 100)];
    [lView setCenter:CGPointMake(self.view.centerX, self.view.centerY)];
    [lView setBackgroundColor:[UIColor grayColor]];
    lView.layer.cornerRadius = 8;
    [self.view addSubview:lView];
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] init];
    [activity setSize:CGSizeMake(40, 40)];
    [activity setCenterX:lView.height/2];
    [activity setCenterY:lView.width/2];
    [activity startAnimating];
    [lView addSubview:activity];
}

- (IBAction)doWork:(UIButton *)sender {
    
    if (!lView) {
        [self loadingView];
    }
    
    // 延迟2秒执行：
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // code to be executed on the main queue after delay
        [lView removeFromSuperview];
        lView = nil;
    });
    
    
    //并行执行
    __block int k = 1;
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        // 并行执行的线程一
        [NSThread sleepForTimeInterval:3];//挂起3秒，不能执行其他操作
        NSLog(@"kkk");
        NSLog(@"%d",k);
        int b = k;
        NSLog(@"b=%d",b);
        b = 2;
        NSLog(@"k = %d",k);
        NSLog(@"b = %d",b);

    });
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        // 并行执行的线程二
        [NSThread sleepForTimeInterval:2];
        NSLog(@"lll");

    });
    dispatch_group_notify(group, dispatch_get_global_queue(0,0), ^{
        // 汇总结果
        NSLog(@"%d",k);
    });
}
#pragma mark 翻转
-(IBAction)ActionFanzhuan{
    //获取当前画图的设备上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //开始准备动画
    [UIView beginAnimations:nil context:context];
    //设置动画曲线，翻译不准，见苹果官方文档
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //设置动画持续时间
    [UIView setAnimationDuration:1.0];
    //因为没给viewController类添加成员变量，所以用下面方法得到viewDidLoad添加的子视图
    UIView *parentView = [self.view viewWithTag:1000];
    //设置动画效果
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:parentView cache:YES];  //从上向下
    // [UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView:parentView cache:YES];   //从下向上
    // [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:parentView cache:YES];  //从左向右
    // [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:parentView cache:YES];//从右向左
    //设置动画委托
    [UIView setAnimationDelegate:self];
    //当动画执行结束，执行animationFinished方法
    [UIView setAnimationDidStopSelector:@selector(animationFinished:)];
    //提交动画
    [UIView commitAnimations];
}

- (void) animationFinished: (id) sender{
    NSLog(@"animationFinished !");
}


@end

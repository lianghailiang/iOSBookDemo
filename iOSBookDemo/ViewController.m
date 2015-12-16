//
//  ViewController.m
//  iOSBookDemo
//
//  Created by lianghailiang on 15/12/15.
//  Copyright © 2015年 jinvovo_ios. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <YYKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIFont familyNames];//字体库
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *document = paths.firstObject;

    __block int a  = 0;
    void (^sillyBlock)(void  ) = ^{ a = 47 ;};
    
    NSLog(@"a == %d",a);
    
    sillyBlock();
    NSLog(@"a = = %d",a);
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[NSUserDefaults standardUserDefaults]);
    
    YYTimer *timer = [YYTimer timerWithTimeInterval:2 target:self selector:@selector(kkk) repeats:YES];
    [timer fire];
}

- (void)kkk{
    NSLog(@"YYTimer");
}

- (IBAction)doWork:(UIButton *)sender {
//    NSDate *statTime = [NSDate date];
//    NSLog(@"%@",statTime);
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        NSLog(@"jjj");
//        [NSThread sleepForTimeInterval:3];//挂起3秒，不能执行其他操作
//        NSLog(@"kkk");
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"lll");
//        
//        NSDate *statTime = [NSDate date];
//        NSLog(@"%@",statTime);
//
//    });
    
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"1111111111111");
    
    
}


@end

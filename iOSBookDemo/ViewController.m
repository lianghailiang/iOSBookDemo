//
//  ViewController.m
//  iOSBookDemo
//
//  Created by lianghailiang on 15/12/15.
//  Copyright © 2015年 jinvovo_ios. All rights reserved.
//

#import "ViewController.h"

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
    
    NSLog(@"YES");
}

- (IBAction)doWork:(UIButton *)sender {
    NSDate *statTime = [NSDate date];
    NSLog(@"%@",statTime);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"jjj");
        [NSThread sleepForTimeInterval:3];//挂起3秒，不能执行其他操作
        NSLog(@"kkk");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"lll");
        
        NSDate *statTime = [NSDate date];
        NSLog(@"%@",statTime);

    });
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"1111111111111");
    
    
}


@end

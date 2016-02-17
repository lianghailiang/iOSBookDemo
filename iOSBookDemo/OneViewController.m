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
@property (weak, nonatomic) IBOutlet UIImageView *iii;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width_k;

@property (nonatomic ,strong) IssueAnimation *issueAnimation;

@end

@implementation OneViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIFont familyNames];//字体库

//    self.iii.hidden = YES;
    self.width_k.constant = 0;

    __block int a  = 0;
    void (^sillyBlock)(void  ) = ^{ a = 47 ;};
    
    NSLog(@"a == %d",a);
    
    sillyBlock();
    NSLog(@"a == %d",a);
    
    NSLog(@"%@",[NSUserDefaults standardUserDefaults]);
    
    YYTimer *timer = [YYTimer timerWithTimeInterval:2 target:self selector:@selector(kkk) repeats:YES];
    [timer fire];
    
    CGFloat offset = 20.0f;
    _button.titleEdgeInsets = UIEdgeInsetsMake(0, -_button.imageView.frame.size.width, -_button.imageView.frame.size.height-offset/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    _button.imageEdgeInsets = UIEdgeInsetsMake(-_button.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -_button.titleLabel.intrinsicContentSize.width);
    
    [self auth];

}

- (void)auth{
    
}

- (void)kkk{
    NSLog(@"YYTimer");
}

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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

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

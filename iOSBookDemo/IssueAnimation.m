//
//  IssueAnimation.m
//  iOSBookDemo
//
//  Created by lianghailiang on 15/12/28.
//  Copyright © 2015年 jinvovo_ios. All rights reserved.
//

#import "IssueAnimation.h"
#import <YYKit/YYKit.h>
#import <pop/POP.h>

@implementation IssueAnimation{
    UIView *blurView;
    UIView *view;
}



- (void)clearBlurView{
    [blurView removeFromSuperview];
    for (id subView in blurView.subviews) {
        [subView removeFromSuperview];
    }
}
- (void)rotate360DegreeWithImageView:(UIView *)imageView{
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         
                         CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0) ];
    animation.duration = 0.2;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = 2;
    
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    CGRect imageRrect = CGRectMake(0, 0,imageView.frame.size.width, imageView.frame.size.height);
    UIGraphicsBeginImageContext(imageRrect.size);
    UIGraphicsEndImageContext();
    
    [imageView.layer addAnimation:animation forKey:nil];
    
}
- (IBAction)d:(id)sender {
    view = [UIApplication sharedApplication].keyWindow;
    
    blurView = [[UIView alloc] init];
    [blurView setTag:10];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    ((UIVisualEffectView *)blurView).frame = view.frame;
    [[[UIApplication sharedApplication].delegate window] addSubview:blurView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearBlurView)];
    [blurView addGestureRecognizer:tap];
    UIImageView *closeImg = [[UIImageView alloc] initWithFrame:CGRectMake(blurView.width-39, blurView.height/2-37, 39, 77)];
    [closeImg setImage:[UIImage imageNamed:@"btn_fbgb"]];
    [blurView addSubview:closeImg];
    
    for (int i = 0; i < 4; i++) {
        CGPoint kPoint = CGPointMake(view.frame.size.width - 50, view.frame.size.height*0.5);
        UIView *kView = [[UIView alloc] init];
        [kView setSize:CGSizeMake(86, 86)];
        //        [kView setBackgroundColor:[UIColor redColor]];
        [kView setOrigin:kPoint];
        [blurView addSubview:kView];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kView.width, kView.height)];
        [kView addSubview:img];
        NSString *imgName = [NSString stringWithFormat:@"btn_fb_%d",i];
        [img setImage:[UIImage imageNamed:imgName]];
        
        [self rotate360DegreeWithImageView:kView];
        
        [UIView animateWithDuration:0.5 animations:^{
            //            kView.transform = CGAffineTransformMakeRotation(M_PI*0.1);
            //            [self rotate360DegreeWithImageView:kView];
        } completion:^(BOOL finished) {
            //            [UIView animateWithDuration:0.2 animations:^{
            //                kView.transform = CGAffineTransformMakeRotation(M_PI);
            //            }];
        }];
        
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        CGFloat centerX = kPoint.x - 80 - 140 * sinf(i * M_PI / (4 - 1));
        CGFloat centerY = kPoint.y  - 140 * cosf(i * M_PI / (4 - 1));
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
        anim.springBounciness = 5;
        anim.springSpeed = 2;
        [kView pop_addAnimation:anim forKey:@"center"];
        
        NSLog(@"%f %f",kView.origin.x,kView.origin.y);
    }
}


@end

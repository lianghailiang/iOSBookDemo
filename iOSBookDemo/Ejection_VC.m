//
//  Ejection_VC.m
//  iOSBookDemo
//
//  Created by lianghailiang on 16/2/19.
//  Copyright © 2016年 jinvovo_ios. All rights reserved.
//

#import "Ejection_VC.h"

@interface Ejection_VC (){
    UIView *popView;
}

@end

@implementation Ejection_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    popView = [[UIView alloc] init];
    [popView setFrame:CGRectMake(0, self.view.bottom, self.view.width, self.view.height*0.65)];
    [popView setBackgroundColor:[UIColor lightGrayColor]];
    [[UIApplication sharedApplication].keyWindow addSubview:popView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [popView addGestureRecognizer:tap];
}

- (void)tapAction:(UIGestureRecognizer *)sender{
    [UIView animateWithDuration:0.3 animations:^{
        [self.view.layer setTransform:CATransform3DIdentity];
        [popView setCenterY:popView.centerY+popView.height];
    }];
    [UIView animateWithDuration:0.3 animations:^{
        //        [self.view.layer setTransform:[self firstTransform]];
    }];
}

- (IBAction)hidden:(UIButton *)sender {

}

- (IBAction)action:(UIButton *)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view.layer setTransform:[self firstTransform]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            
            [self.view.layer setTransform:[self secondTransform]];
            [popView setCenterY:popView.centerY-popView.height];
            
        }];
    }];

}

- (CATransform3D)firstTransform{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    //带点缩小的效果
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    //绕x轴旋转
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
    return t1;
}
     
- (CATransform3D)secondTransform{
    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = [self firstTransform].m34;
    //向上移
    t2 = CATransform3DTranslate(t2, 0, self.view.frame.size.height * (-0.08), 0);
    //第二次缩小
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
    return t2;
}


@end

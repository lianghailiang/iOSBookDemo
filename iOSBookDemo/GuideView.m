//
//  GuideView.m
//  iOSBookDemo
//
//  Created by lianghailiang on 16/1/11.
//  Copyright © 2016年 jinvovo_ios. All rights reserved.
//

#import "GuideView.h"

@interface GuideView ()

@end

@implementation GuideView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)ok:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"First"];
    [self.view removeFromSuperview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

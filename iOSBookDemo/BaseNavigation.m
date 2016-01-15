//
//  BaseNavigation.m
//  iOSBookDemo
//
//  Created by lianghailiang on 16/1/11.
//  Copyright © 2016年 jinvovo_ios. All rights reserved.
//

#import "BaseNavigation.h"
#import "GuideView.h"

@interface BaseNavigation (){
    GuideView *guide;
}

@end

@implementation BaseNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL isFirst = (BOOL)[[NSUserDefaults standardUserDefaults] objectForKey:@"First"];
    if (!isFirst) {
        guide = [[GuideView alloc] init];
        [guide.view setFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:guide.view];
    }
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

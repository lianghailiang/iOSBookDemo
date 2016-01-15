//
//  UserAccountsData.m
//  JinWoWo_IOS
//
//  Created by 杨鹤 on 15/3/16.
//  Copyright (c) 2015年 杨鹤. All rights reserved.
//

#import "UserAccountsData.h"

@implementation UserAccountsData
@synthesize experienceGold,cash,wowoGold,pvgold;

- (id)copyWithZone:(NSZone *)zone{
    return (id)self;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return (id)self;
}

//如果遇到找不到键值执行这个方法，不处理
- (void)setValue:(id)value forUndefinedKey:(NSString *)key  {
    NSLog(@"UndefinedKey:%@",key);
}

@end

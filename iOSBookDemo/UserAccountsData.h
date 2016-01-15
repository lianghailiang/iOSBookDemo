//
//  UserAccountsData.h
//  JinWoWo_IOS
//
//  Created by 杨鹤 on 15/3/16.
//  Copyright (c) 2015年 杨鹤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAccountsData : NSObject<NSMutableCopying,NSCopying>

@property (nonatomic, strong) NSNumber *experienceGold;//体验金
@property (nonatomic, strong) NSNumber *cash;//现金
@property (nonatomic, strong) NSNumber *wowoGold;//窝币
@property (nonatomic, strong) NSNumber *pvgold;//佣金
@property (nonatomic, strong) NSNumber *wowoTotal;//用户等级


@end

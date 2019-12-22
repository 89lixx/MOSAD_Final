//
//  TabBarController.m
//  FinalApp
//
//  Created by 祥哥 on 2019/12/20.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabBarController.h"
#import "Calendar.h"
@interface TabBarController()
@property(nonatomic, strong) Calendar * calendar;
@property(nonatomic, strong) Calendar * calendar1;
@property(nonatomic, strong) Calendar * calendar3;
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Inbox";
    
    self.calendar = [[Calendar alloc] init];
    self.calendar.tabBarItem.title = @"task";
//    self.calendar.tabBarItem.image = [[UIImage imageNamed:@"calendar3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:self.calendar];
    
    self.calendar1 = [[Calendar alloc] init];
    self.calendar1.tabBarItem.title = @"calendar";
    [self addChildViewController:self.calendar1];
 
    self.calendar3 = [[Calendar alloc] init];
    self.calendar3.tabBarItem.title = @"settings";
    [self addChildViewController:self.calendar3];
//    self.selectedIndex = 2;
}

- (void)viewDidAppear:(BOOL)animated{
    
}

//点击后不能直接改变selectedIndex
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if([tabBar.selectedItem.title  isEqual: @"task"]) self.title = @"Inbox";
    else if([tabBar.selectedItem.title  isEqual: @"calendar"]) self.title = @"Today";
    else if([tabBar.selectedItem.title  isEqual: @"settings"]) self.title = @"Settings";
}

@end

//
//  Calendar.m
//  FinalApp
//
//  Created by 祥哥 on 2019/12/20.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calendar.h"

@interface Calendar()
@property(nonatomic, strong)UIView * v;
@property(nonatomic, strong)UIColor * blue;
@end

@implementation Calendar

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blue = [UIColor colorWithRed:86.0/255 green:129.0/255 blue:236.0/255 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = self.blue;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.v = [[UIView alloc] initWithFrame:self.view.frame];
    self.v.backgroundColor = [UIColor redColor];
//    self.navigationItem.title = @"Inbox";
//    [self.view addSubview:self.v];
}

@end

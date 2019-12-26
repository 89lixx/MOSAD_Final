//
//  inBox.m
//  FinalApp
//
//  Created by a wd on 2019/12/25.
//  Copyright © 2019 apple. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "inBox.h"
@interface inBox()<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property(nonatomic, strong)UIColor * blue;
@property(nonatomic, strong) UIColor * lightgray;
@property(nonatomic, strong) UIColor * lightblue;
@property(nonatomic, strong) NSMutableArray * plans;
@property(nonatomic, strong) NSMutableArray * dates;
@property(nonatomic, assign) NSInteger dateNum;
@property(nonatomic, assign) NSInteger actNum;
@property(nonatomic, assign) BOOL judgeData;
@end

@implementation inBox

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blue = [UIColor colorWithRed:86.0/255 green:129.0/255 blue:236.0/255 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = self.blue;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.lightgray = [UIColor colorWithRed:245.0/255 green:246.0/255 blue:247.0/255 alpha:1.0];
    self.lightblue = [UIColor colorWithRed:222.0/255 green:229.0/255 blue:251.0/255 alpha:1.0];
    self.dateNum = 2;
    self.dates = [[NSMutableArray alloc] init];
    self.plans = [[NSMutableArray alloc] init];
    self.judgeData = false;
//    NSMutableArray * activites1 = [[NSMutableArray alloc] init];
//    [activites1 addObject:@"2019-12-25"];
//    [activites1 addObject:@"aaa"];
//    [activites1 addObject:@"bbb"];
//    [activites1 addObject:@"ccc"];
//
//    NSMutableArray * activites2 = [[NSMutableArray alloc] init];
//    [activites2 addObject:@"2019-12-26"];
//    [activites2 addObject:@"ddd"];
//    [activites2 addObject:@"ccc"];
//    [activites2 addObject:@"fff"];
//    [activites2 addObject:@"eee"];
//
//    [_dates addObject:activites1];
//    [_dates addObject:activites2];
//
    self.view.backgroundColor = self.lightgray;
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 690) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        if(_judgeData)
        {
            _tableView.backgroundColor = _lightgray;
        }
        else
        {
            _tableView.backgroundColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:1.0];
        }
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num = 1;
    if(_judgeData)
    {
        num = [self.dates[section] count];
    }
    return num;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger num = 1;
    if([self.dates count] != 0)
    {
        _judgeData = true;
        num = [self.dates count];
    }
    return num;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger num = 55;
    if(_judgeData){
        if (indexPath.row == 0) {
            num = 30;
        }
        else
        {
            num = 55;
        }
    }
    else
    {
        num = 300;
    }
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
    cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(_judgeData)
    {
        if (indexPath.row == 0) {
            cell.textLabel.text = self.dates[indexPath.section][0];
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.backgroundColor = [UIColor colorWithRed:222.0/255 green:229.0/255 blue:251.0/255 alpha:1.0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        else
        {
            cell.textLabel.text = self.dates[indexPath.section][indexPath.row];
        }
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"test.png"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}

@end

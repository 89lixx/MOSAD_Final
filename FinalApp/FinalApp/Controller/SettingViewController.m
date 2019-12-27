//
//  Task.m
//  FinalApp
//
//  Created by 祥哥 on 2019/12/23.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "SignupViewController.h"
@interface SettingViewController() <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIView* userView;
@property (nonatomic, strong) LoginViewController * login;
@property (nonatomic, strong) SignupViewController * signup;
@property (nonatomic, strong) UILabel* username;
@property (nonatomic, strong) NSString * lastName;
@end

@implementation SettingViewController

- (void)viewDidLoad{
    [self settingNav];
//    [self.view addSubview:self.userView];
    
    self.signIn = NO;
    [self.view addSubview:self.tableView];
}
-(NSMutableDictionary*)splitActivity:(NSString *)string{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    if(string.length == 0) return dic;
    //    NSDictionary * dic = [[NSDictionary alloc] init];
    NSArray * arr = [string componentsSeparatedByString:@"\n"];
//    NSLog(@"arr %@",arr);
    for(NSInteger i = 0; i < arr.count; ++ i) {
        NSArray * temp = [arr[i] componentsSeparatedByString:@":"];
        NSArray * temp1 = [temp[1] componentsSeparatedByString:@","];
        [dic setObject:temp1 forKey:temp[0]];
    }
    return dic;
}
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"load view");
    if(self.login.username.text.length != 0) {
        if(self.username.text.length == 0) {
            self.username.text = self.login.username.text;
            self.signIn = YES;
            self.activity = self.login.activity;
            self.name = self.login.username.text;
            self.pwd = self.login.password.text;
        }
        else {
            if([self.username.text isEqualToString:self.login.username.text]){
                self.signIn = NO;
            }
            else {
                self.username.text = self.login.username.text;
                self.signIn = YES;
                self.activity = self.login.activity;
                self.name = self.login.username.text;
                self.pwd = self.login.password.text;
            }
        }
    }
    
    
    
    
//    [self.userView addSubview:self.username];
}

- (void)settingNav{
    [self.navigationItem setTitle:@"Setting"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:97.0/255 green:127.0/255 blue:222.0/255 alpha:1]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
}

- (UIView*)userView {
    if (_userView == nil) {
        _userView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220)];
        [_userView setBackgroundColor:[UIColor whiteColor]];
        
        float itemSize = 100;
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-itemSize/2, 50, itemSize, itemSize)];
        [img setImage:[UIImage imageNamed:@"English.png"]];
        [img.layer setMasksToBounds:YES];
        [img.layer setCornerRadius:img.frame.size.height/2];
        
        float len = 200;
        self.username = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-len/2, 80+itemSize, len, 25)];
        [self.username setTextAlignment:NSTextAlignmentCenter];
        [self.username setFont:[UIFont systemFontOfSize:18]];
        [self.username setText:@"Username"];
        
        [_userView addSubview:img];
        [_userView addSubview:_username];
    }
    if(self.login.username.text.length != 0) {
        self.username.text = self.login.username.text;
        [_username addSubview:_username];
    }
    return _userView;
}

- (UITableView*)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.separatorInset = UIEdgeInsetsMake(0,20,0,20);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableCell"];
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int i = 1;
    switch (section) {
        case 0:
            i = 2;
            break;
        case 1:
            i = 3;
            break;
        case 2:
            i = 4;
            break;
    }
    return i;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        NSLog(@"denglu");
        self.login = [[LoginViewController alloc] init];
        self.signup = [[SignupViewController alloc] init];
        [self.navigationController pushViewController:self.login animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 220;
    }
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.contentView addSubview:self.userView];
        }
        else {
            
            [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
            [cell.textLabel setText:@"登录"];
            [cell.textLabel setFont:[UIFont systemFontOfSize:21]];
            [cell.textLabel setTextColor:[UIColor blueColor]];
        }
        return cell;
    }
    
    if (indexPath.section == 1) {
        switch(indexPath.row) {
            case 0:
                [cell.imageView setImage:[UIImage imageNamed:@"home.png"]];
                [cell.textLabel setText:@"Theme"];
                break;
            case 1:
                [cell.imageView setImage:[UIImage imageNamed:@"list.png"]];
                [cell.textLabel setText:@"List"];
                break;
            case 2:
                [cell.imageView setImage:[UIImage imageNamed:@"lock.png"]];
                [cell.textLabel setText:@"Security"];
                break;
        }
    }
    else if (indexPath.section == 2) {
        switch(indexPath.row) {
            case 0:
                [cell.imageView setImage:[UIImage imageNamed:@"plane.png"]];
                [cell.textLabel setText:@"Tutorial"];
                break;
            case 1:
                [cell.imageView setImage:[UIImage imageNamed:@"document.png"]];
                [cell.textLabel setText:@"Feedback & Suggestion"];
                break;
            case 2:
                [cell.imageView setImage:[UIImage imageNamed:@"book.png"]];
                [cell.textLabel setText:@"About"];
                break;
            case 3:
                [cell.imageView setImage:[UIImage imageNamed:@"like.png"]];
                [cell.textLabel setText:@"Recomment to Friends"];
                break;
        }
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    CGSize itemSize = CGSizeMake(45, 45);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [cell.textLabel setFont:[UIFont systemFontOfSize:22]];
    
    return cell;
}

@end

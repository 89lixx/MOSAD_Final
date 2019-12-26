//
//  LoginViewController.h
//  Setting
//
//  Created by Hsy on 2019/12/26.
//  Copyright © 2019 Hsy. All rights reserved.
//

#ifndef LoginViewController_h
#define LoginViewController_h
#import "UIKit/UIKit.h"

@interface LoginViewController : UIViewController
@property (nonatomic, strong) UITextField* username;
@property (nonatomic, strong) UITextField* password;
@property (nonatomic, strong) NSString * activity;
@end

#endif /* LoginViewController_h */

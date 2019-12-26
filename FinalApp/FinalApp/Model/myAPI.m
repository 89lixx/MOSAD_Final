//
//  myAPI.m
//  FinalApp
//
//  Created by 祥哥 on 2019/12/26.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myAPI.h"
@interface myAPI()
@property(nonatomic, strong) NSString* content;
@end

@implementation myAPI

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (NSString *)login:(NSString *)name :(NSString *)pwd{
    static NSString * sring;
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    
    NSURLSessionConfiguration * defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * delegateFreeSession = [NSURLSession sessionWithConfiguration:defaultConfigObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURL * url = [NSURL URLWithString:@"http://127.0.0.1:3000/login"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    
    // 设置请求体为JSON

    NSDictionary * dic = [[NSDictionary alloc] initWithObjectsAndKeys:name,@"name",pwd,@"pwd", nil];
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    [urlRequest setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSessionDataTask * dataTask = [delegateFreeSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse * response, NSError * error){
        if(error == nil) {
            sring = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"ssss %@",sring);
            
        }
        dispatch_group_leave(group);
    }];
    [dataTask resume];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       
    });
    NSLog(@"return  %@",sring);
    return sring;
}

@end

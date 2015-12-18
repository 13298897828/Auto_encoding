//
//  ViewController.m
//  runtime
//
//  Created by 张天琦 on 15/12/18.
//  Copyright © 2015年 张天琦. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+AutoEncoding.h"
#import "Boy.h"
#import "Girl.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Boy *boy = [Boy new];
    boy.name = @"aaa";
    boy.age = 11;

    Girl *girl = [Girl new];
    girl.name = @"xue";
    boy.girl = girl;

    NSData *date =[NSKeyedArchiver archivedDataWithRootObject:boy];
    
    Boy *boy1 = [NSKeyedUnarchiver unarchiveObjectWithData:date];
    NSLog(@"%@ %@",boy1.name,boy.girl.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

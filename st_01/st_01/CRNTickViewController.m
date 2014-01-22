//
//  CRNTickViewController.m
//  st_01
//
//  Created by 吕腾飞 on 14-1-21.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import "CRNTickViewController.h"

@interface CRNTickViewController ()

@end

@implementation CRNTickViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"init view didload");
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"be called");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"memory be die");
}

@end

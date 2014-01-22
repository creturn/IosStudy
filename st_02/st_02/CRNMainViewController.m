//
//  CRNMainViewController.m
//  st_02
//
//  Created by 吕腾飞 on 14-1-21.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import "CRNMainViewController.h"
#import "CRNBlueViewController.h"
#import "CRNYellowViewController.h"
@interface CRNMainViewController ()
@end

@implementation CRNMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


//视图切换，其中视图切换只是进行视图的插入和移除
- (IBAction)on_click_return:(id)sender {
    
    //进行动画场景效果处理
    [UIView beginAnimations:@"begin view animation" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if (self.yellowViewContorller.view.superview == nil) {
        if (self.yellowViewContorller == nil) {
            self.yellowViewContorller = [[CRNYellowViewController alloc] initWithNibName:@"YellowView" bundle:nil];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        [self.blueViewContorller.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewContorller.view atIndex:0];
    } else {
        if (self.blueViewContorller.view.superview == nil) {
            if (self.blueViewContorller == nil) {
                self.blueViewContorller = [[CRNBlueViewController alloc] initWithNibName:@"BlueView" bundle:0];
            }
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            [self.yellowViewContorller.view removeFromSuperview];
            [self.view insertSubview:self.blueViewContorller.view atIndex:0];
        }
    }

    [UIView commitAnimations];
}


//内存不够时候被调用
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if (self.yellowViewContorller.view.superview == nil) {
        self.yellowViewContorller = nil;
    } else {
        self.blueViewContorller = nil;
    }
}
@end

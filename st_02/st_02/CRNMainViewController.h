//
//  CRNMainViewController.h
//  st_02
//
//  Created by 吕腾飞 on 14-1-21.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CRNBlueViewController;
@class CRNYellowViewController;
@interface CRNMainViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) CRNBlueViewController *blueViewContorller;
@property (strong, nonatomic) CRNYellowViewController *yellowViewContorller;
- (IBAction)on_click_return:(id)sender;
@end

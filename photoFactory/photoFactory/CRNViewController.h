//
//  CRNViewController.h
//  photoFactory
//
//  Created by 吕腾飞 on 14-1-22.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRNViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)onclick_open_camera:(id)sender;
- (IBAction)onclick_open_photolib:(id)sender;
- (IBAction)onclick_photo_beaut:(id)sender;
@end

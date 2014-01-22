//
//  CRNViewController.m
//  photoFactory
//
//  Created by 吕腾飞 on 14-1-22.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import "CRNViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface CRNViewController ()

@end

@implementation CRNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//打开摄像头
- (IBAction)onclick_open_camera:(id)sender {
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imgPicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:imgPicker.sourceType];
    }
    imgPicker.delegate = self;
    imgPicker.allowsEditing = YES;
    [self presentViewController:imgPicker animated:YES completion:nil];
}
//打开相册
- (IBAction)onclick_open_photolib:(id)sender {
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imgPicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:imgPicker.sourceType];
    }
    imgPicker.delegate = self;
    imgPicker.allowsEditing = YES;
    [self presentViewController:imgPicker animated:YES completion:nil];
}
//图片美化处理
- (IBAction)onclick_photo_beaut:(id)sender {

}

//选择图像后回调方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //回调方法中info里面包含了img信息
    UIImage *img = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSLog(@"img width:%f", img.size.width);
    //设置image的尺寸
    CGSize imagesize = img.size;
    imagesize.height =500;
    imagesize.width = img.size.width*500/img.size.height;
    img = [self imageWithImage:img scaledToSize:imagesize];
    [_imgView setImage:img];
    [picker dismissModalViewControllerAnimated:YES];
}


//对图片尺寸进行压缩--
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}
@end

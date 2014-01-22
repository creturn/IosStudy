//
//  CRNViewController.h
//  localtion
//
//  Created by 吕腾飞 on 14-1-22.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CRNViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManger;
@property (weak, nonatomic) IBOutlet UILabel *lab_long;
@property (weak, nonatomic) IBOutlet UILabel *lab_lat;
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lab_address;

- (IBAction)get_address:(id)sender;
@end

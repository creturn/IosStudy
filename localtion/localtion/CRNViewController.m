//
//  CRNViewController.m
//  localtion
//
//  Created by 吕腾飞 on 14-1-22.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import "CRNViewController.h"

@interface CRNViewController ()

@end

@implementation CRNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManger = [[CLLocationManager alloc] init];
    _locationManger.delegate = self;
    _locationManger.desiredAccuracy = kCLLocationAccuracyBest;

}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *newLocation = [locations lastObject];
    NSString *lat = [NSString stringWithFormat:@"%g\u00b0" ,newLocation.coordinate.latitude];
    NSString *lon = [NSString stringWithFormat:@"%g\u00b0", newLocation.coordinate.longitude];
    [_lab_lat setText:lat];
    [_lab_long setText:lon];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)start:(id)sender {
    [_locationManger startUpdatingLocation];
}

- (IBAction)stop:(id)sender {
    [_locationManger stopUpdatingLocation];
}
- (IBAction)get_address:(id)sender {
    
    NSString *lat =[_lab_lat.text substringToIndex:_lab_lat.text.length - 1 ];
    NSString *lon = [_lab_long.text substringToIndex:_lab_long.text.length - 1];
    NSString *apiUrl = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?latlng=%@,%@&language=zh-CN&sensor=true",lat,lon];
    //获取反查信息并解析
    NSURL *url = [NSURL URLWithString:apiUrl];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSData *recive = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:recive options:NSJSONReadingMutableLeaves error:nil];

    NSArray *addInfo = [rootDic objectForKey:@"results"];
    if ([addInfo count] > 0) {
        NSDictionary *result = [addInfo objectAtIndex:0];
        NSDictionary *addr = [result objectForKey:@"formatted_address"];
        _lab_address.text = [NSString stringWithFormat:@"%@",addr];
    } else {
        _lab_address.text = @"没查到哦";
    }
   
   
}
@end

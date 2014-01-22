//
//  CRNViewController.h
//  st_01
//
//  Created by 吕腾飞 on 14-1-19.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRNViewController : UIViewController <UISearchBarDelegate, UIActionSheetDelegate, UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *txt_input;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *lab_text_show;
- (IBAction)onclick_button:(id)sender;
- (IBAction)click_alert:(id)sender;
- (IBAction)click_action_sheet:(id)sender;
- (IBAction)click_add_search_bar:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)btn_content_add:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSMutableArray *list;
@end

//
//  CRNAppDelegate.h
//  TestMacDev
//
//  Created by 吕腾飞 on 14-1-22.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AddressBook/AddressBook.h>
@interface CRNAppDelegate : NSObject <NSApplicationDelegate,NSTableViewDataSource,NSTableViewDelegate>
{
    NSMutableArray *dataSource;
    
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSBox *box;

- (IBAction)onclick_remove_login:(id)sender;
- (IBAction)onclick_add_login:(id)sender;
@property (weak) IBOutlet NSBox *tableBox;
@property (weak) IBOutlet NSTableView *table;
@property (weak) IBOutlet NSTextField *txt_id;
@property (weak) IBOutlet NSTextField *txt_name;
@property (weak) IBOutlet NSTextField *txt_qq;
@property (weak) IBOutlet NSTextField *txt_number;
- (IBAction)onclick_add_data:(id)sender;
- (IBAction)onclick_getAddressBooks:(id)sender;

@end

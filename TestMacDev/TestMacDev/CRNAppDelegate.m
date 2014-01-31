//
//  CRNAppDelegate.m
//  TestMacDev
//
//  Created by 吕腾飞 on 14-1-22.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import "CRNAppDelegate.h"

@implementation CRNAppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [_table setDelegate:self];
    [_table setDataSource:self];
    
    dataSource = [[NSMutableArray alloc] init];
    NSColor *mColor = [NSColor colorWithDeviceRed:52 green:73 blue:94 alpha:0.98];
    [_window setBackgroundColor:mColor];
}

- (IBAction)onclick_remove_login:(id)sender {
    [dataSource removeAllObjects];
    [dataSource addObject:[[NSArray alloc] initWithObjects:@"1",@"creturn",@"312434126",@"18627161840", nil]];
    [dataSource addObject:[[NSArray alloc] initWithObjects:@"2",@"fly",@"424429722",@"13429802815", nil]];
    [dataSource addObject:[[NSArray alloc] initWithObjects:@"3",@"aabb",@"429722",@"13429802815", nil]];
    [_tableBox setTitle:@"用户列表"];
    [self showList];
}

- (IBAction)onclick_add_login:(id)sender {
    [self showLogin];
}


//禁止双击编辑
- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    return NO;
}
//行内容被选中时候调用
- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    NSArray *item = [dataSource objectAtIndex:row];
    [_txt_id setStringValue:[item objectAtIndex:0]];
    [_txt_name setStringValue:[item objectAtIndex:1]];
    [_txt_qq setStringValue:item[2]]; //数组索引方式读取
    [_txt_number setStringValue:item[3]];
    return YES;
}
//初始化填充数据时候被调用
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    return [[dataSource objectAtIndex:row] objectAtIndex:[[tableColumn identifier] intValue] - 1];
}
//统计数据内容行数总量时候被调用
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    NSLog(@"Data count:%lu", (unsigned long)[dataSource count]);
    return dataSource.count;
}
//表格中添加数据
- (IBAction)onclick_add_data:(id)sender {
    NSString *Id = [_txt_id stringValue];
    NSString *Name = [_txt_name stringValue];
    NSString *QQ = [_txt_qq stringValue];
    NSString *Number = [_txt_number stringValue];
    NSArray *newData = [[NSArray alloc] initWithObjects:Id,Name,QQ,Number, nil];
    [dataSource addObject:newData];
    [_table reloadData];
    [_txt_id setStringValue:@"0"];
    [_txt_name setStringValue:@""];
    [_txt_number setStringValue:@""];
    [_txt_qq setStringValue:@""];
}

//获取通讯录数据
- (IBAction)onclick_getAddressBooks:(id)sender {
    [dataSource removeAllObjects];
    ABAddressBook *ab = [ABAddressBook sharedAddressBook];
    NSArray *persionList = [ab people];
    
    for (int i = 0; i < persionList.count; i++) {
        NSString *fName = [[persionList objectAtIndex:i] valueForProperty:kABFirstNameProperty];
        NSString *lName = [[persionList objectAtIndex:i] valueForProperty:kABLastNameProperty];
        ABMultiValue *phone = [[persionList objectAtIndex:i] valueForProperty:kABPhoneProperty];
        NSString *phoneNumber = [phone valueAtIndex:0] == nil ? @"" : [[phone valueAtIndex:0] stringByReplacingOccurrencesOfString:@"-" withString:@""];
        NSString *qqNumber = @"";
        if ([phone count] > 1) {
            qqNumber = [phone valueAtIndex:1] == nil ? @"" : [[phone valueAtIndex:1] stringByReplacingOccurrencesOfString:@"-" withString:@""];
        } else {
            qqNumber = @"";
        }
        if (fName == Nil) fName = @"";
        if (lName == Nil) lName = @"";
        [dataSource addObject:[[NSArray alloc] initWithObjects:@(i),[lName stringByAppendingString:fName],qqNumber,phoneNumber, nil]];
    }
    
    [_table reloadData];
    [_tableBox setTitle:@"通讯录"];
    [self showList];

}
//显示登陆框
-(void)showLogin{
    [_box setTitle:@"用户登陆"];
    [_tableBox removeFromSuperview];
    NSRect wRect = [_window.contentView frame];
    _box.frame = wRect;
    [_window.contentView addSubview:_box];
}
//显示列表
-(void)showList{
    [_table reloadData];
    [_box removeFromSuperview];
    NSRect wRect = [_window.contentView frame];
    _tableBox.frame = wRect;
    [_window.contentView addSubview:_tableBox];
}
@end

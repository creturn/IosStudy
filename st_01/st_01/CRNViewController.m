//
//  CRNViewController.m
//  st_01
//
//  Created by 吕腾飞 on 14-1-19.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import "CRNViewController.h"

@interface CRNViewController ()

@end

@implementation CRNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //search bar 初始化
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 65, 320, 44)];
    [_searchBar setSearchBarStyle:UISearchBarStyleDefault];
    _searchBar.showsCancelButton = YES;
    [_searchBar setDelegate:self];
    //table view 初始化
    [_table setDelegate:self];
    self.list = [[NSMutableArray alloc] init];
    [_list addObject:@"吃货"];
    [_list addObject:@"二货"];
    [_list addObject:@"不爱劳动只爱吃"];
    [_list addObject:@"只爱花钱不爱赚"];
    [_table setDataSource:self];
    _table.allowsSelection = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//button click event handle
- (IBAction)onclick_button:(id)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *painText = [NSString stringWithFormat:@"%@ 按钮被点击了", title];
    _lab_text_show.text = painText;
   }
//显示alert 控件
- (IBAction)click_alert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"看看alertView" delegate:self cancelButtonTitle:@"可以"  otherButtonTitles:@"取消", nil];
    [alert show];
}
//显示 action sheet view
- (IBAction)click_action_sheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:Nil delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"你想干啥？" otherButtonTitles:@"吃饭",@"看电影",@"睡觉",nil];
    [actionSheet setDelegate:self];
    [actionSheet showInView:self.view];
}
//添加搜索bar
- (IBAction)click_add_search_bar:(id)sender {
    [[self view] addSubview:_searchBar];
}
//点击空白处
- (IBAction)backgroundTap:(id)sender {
    [self colseSearchBar];
    [_txt_input resignFirstResponder];
}
//添加内容
- (IBAction)btn_content_add:(id)sender {
    [_list insertObject:[_txt_input text] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_table insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [_txt_input setText:@""];
    [_txt_input resignFirstResponder];
}
//添加search bar 到主view
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self colseSearchBar];
}
//关闭搜素
-(void)colseSearchBar{
    [_searchBar resignFirstResponder];
    [_searchBar removeFromSuperview];
    [_searchBar setText:@""];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    //NSLog(@"Now Type:%@", searchText);
    [_lab_text_show setText:searchText];
}
//action sheet be clicked handle
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [_lab_text_show setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
}
//初始化table时候返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.list objectAtIndex:row];
    cell.detailTextLabel.text = @"fly";
    UIImage *img = [UIImage imageNamed:@"qq.png"];
    UIImage *himg = [UIImage imageNamed:@"1.jpg"];
    cell.imageView.highlightedImage = himg;
    cell.imageView.image = img;
    return cell;
}
//返回一共有多少元素
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_list count];
}
//选择行table row时候回调
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_lab_text_show setText:[_list objectAtIndex:[indexPath row]]];
}

//返回是否可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//编辑行样式
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_list removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        //这里是编辑模式下添加
    }
}
@end

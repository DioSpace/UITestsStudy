//
//  GSPageViewController2.m
//  GSUITestDemo
//
//  Created by gersces on 2018/8/30.
//  Copyright © 2018年 gersces. All rights reserved.
//

#import "PageViewController2.h"

@interface PageViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableDictionary *heights;

@end

@implementation PageViewController2

- (NSMutableDictionary *)heights{
    if (!_heights) {
        _heights = [NSMutableDictionary new];
    }
    return _heights;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 88, 375, 812-88-49-34) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"tableViewHeader"];
    if (!header) {
        header = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"tableViewHeader"];
    }
    header.textLabel.text = [NSString stringWithFormat:@"header:%ld",section];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UITableViewHeaderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"tableViewFooter"];
    if (!footer) {
        footer = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"tableViewFooter"];
    }
    footer.textLabel.text = [NSString stringWithFormat:@"footer:%ld",section];
    return footer;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = [self.heights objectForKey:indexPath];
    if (height) {
        return height.floatValue;
    }
    else{
        return 44.f;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSNumber *height = @(cell.frame.size.width);
    [self.heights setObject:height forKey:indexPath];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld:%ld",indexPath.section,indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showAlertWithTitle:[NSString stringWithFormat:@"%ld-%ld",indexPath.section,indexPath.row]];
    NSLog(@"showResult: %ld-%ld",indexPath.section,indexPath.row);
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
}
- (void)showAlertWithTitle:(NSString *)title{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

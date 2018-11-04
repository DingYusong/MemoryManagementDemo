//
//  ViewController.m
//  MemoryManagementDemo
//
//  Created by 丁玉松 on 2018/10/31.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "ViewController.h"
#import "DYSStrongViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,strong) NSArray *dataSourceArray;

@property (nonatomic ,strong) NSMutableString *mutableStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dataSourceArray = @[
                             @{
                                 @"title":@"DYSMemoryViewController",
                                 @"page":@"DYSMemoryViewController"
                                 },
                             @{
                                 @"title":@"DYSCopyViewController",
                                 @"page":@"DYSCopyViewController"
                                 },

                             @{
                                 @"title":@"DYSStrongViewController",
                                 @"page":@"DYSStrongViewController"
                                 },
                             
                             @{
                                 @"title":@"DYSWeekViewController",
                                 @"page":@"DYSWeekViewController"
                                 }];
    
    self.tableView.rowHeight = 50;    
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dict objectForKey:@"title"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:indexPath.row];
    NSString *classString = [dict objectForKey:@"page"];
    UIViewController *vc = [NSClassFromString(classString) new];
    
    if ([classString isEqualToString:@"DYSStrongViewController"]) {
        DYSStrongViewController *svc = (DYSStrongViewController *)vc;
        self.mutableStr = [[NSMutableString alloc] initWithString:@"bbbb"];
        svc.strongString = self.mutableStr;
        [self.navigationController pushViewController:svc animated:YES];
        [self.mutableStr appendString:[[NSMutableString alloc] initWithString:@"cccc"]];
        self.mutableStr = @"cccc";
        return;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}


@end

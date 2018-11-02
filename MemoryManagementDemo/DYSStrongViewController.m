//
//  DYSStrongViewController.m
//  MemoryManagementDemo
//
//  Created by 丁玉松 on 2018/11/2.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSStrongViewController.h"

@interface DYSStrongViewController ()

@end

@implementation DYSStrongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"self.string_strong:%@",self.string_strong);
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

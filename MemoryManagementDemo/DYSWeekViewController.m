//
//  DYSWeekViewController.m
//  MemoryManagementDemo
//
//  Created by DingYusong on 2018/11/3.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSWeekViewController.h"

@interface DYSWeekViewController ()
@property (nonatomic ,weak) NSMutableString *weekMutableString;

@end

@implementation DYSWeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"丁玉松"];
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(str)));

    self.weekMutableString = str;
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(str)));

    
    NSLog(@"%p:%@",str,str);
    NSLog(@"%p:%@",self.weekMutableString,self.weekMutableString);
    
    
    [str appendString:@"哥哥"];
    NSLog(@"%p:%@",str,str);
    NSLog(@"%p:%@",self.weekMutableString,self.weekMutableString);
    
    str = @"小丁";
    NSLog(@"%p:%@",str,str);
    NSLog(@"%p:%@",self.weekMutableString,self.weekMutableString);
    
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(str)));

}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"%p:%@",self.weekMutableString,self.weekMutableString);
    
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(self.weekMutableString)));
    
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

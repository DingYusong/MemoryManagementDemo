//
//  DYSMemoryViewController.m
//  MemoryManagementDemo
//
//  Created by 丁玉松 on 2018/11/1.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSMemoryViewController.h"

@interface DYSMemoryViewController ()

@property (nonatomic ,copy) NSString *string_copy;

@end

NSString *const DYSMemoryViewControllerExternPara = @"extern";

NSInteger globalInt = 10;
NSString *globalStr = @"aaaa";
static NSString *globalStaticStr = @"bbbb";
static NSString *globalStaticStrUnInit;
const static NSString *globalConstStaticStr = @"cccc";

@implementation DYSMemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    static NSString *localStaticStr = @"dddd";
    NSString *tmpLocalStr = @"eeee";
    _string_copy = tmpLocalStr;
    
    NSString *tmpLocalHeapStr = @"ffff";
    
    NSString *tmpLocalHeapStr2 = [NSString stringWithFormat:@"gggg"];
    
//    NSLog(@"%p:globalInt",&globalInt);
//
//    NSLog(@"%p:&globalStr",&globalStr);
//    NSLog(@"%p:globalStr",globalStr);
//
//    NSLog(@"%p:&globalStaticStr",&globalStaticStr);
//    NSLog(@"%p:globalStaticStr",globalStaticStr);
//
//    NSLog(@"%p:&globalStaticStrUnInit",&globalStaticStrUnInit);
//
//    NSLog(@"%p:&globalConstStaticStr",&globalConstStaticStr);
//    NSLog(@"%p:globalConstStaticStr",globalConstStaticStr);
//
//    NSLog(@"%p:&localStaticStr",&localStaticStr);
//    NSLog(@"%p:localStaticStr",localStaticStr);
//
//    NSLog(@"%p:&tmpLocalStr",&tmpLocalStr);
//    NSLog(@"%p:tmpLocalStr",tmpLocalStr);
//
//    NSLog(@"%p:&_string_copy",&_string_copy);
//    NSLog(@"%p:_string_copy",_string_copy);
//
//    NSLog(@"%p:&tmpLocalHeapStr",&tmpLocalHeapStr);
//    NSLog(@"%p:tmpLocalHeapStr",tmpLocalHeapStr);
//
//    NSLog(@"%p:&tmpLocalHeapStr2",&tmpLocalHeapStr2);
//    NSLog(@"%p:tmpLocalHeapStr2",tmpLocalHeapStr2);
//
//    NSLog(@"%p:&DYSMemoryViewControllerExternPara",&DYSMemoryViewControllerExternPara);
//    NSLog(@"%p:DYSMemoryViewControllerExternPara",DYSMemoryViewControllerExternPara);

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    //stack
    NSLog(@"%p:&tmpLocalStr",&tmpLocalStr);
    NSLog(@"%p:&tmpLocalHeapStr2",&tmpLocalHeapStr2);

    
    //heap
    NSLog(@"%p:&_string_copy",&_string_copy);
    NSLog(@"%p:&tmpLocalHeapStr",&tmpLocalHeapStr);
    NSLog(@"%p:tmpLocalHeapStr2",tmpLocalHeapStr2);

    
    //bss
    NSLog(@"%p:&globalStaticStrUnInit",&globalStaticStrUnInit);

    
    //data
    NSLog(@"%p:globalInt",&globalInt);

    NSLog(@"%p:&globalStr",&globalStr);
    NSLog(@"%p:globalStr",globalStr);

    NSLog(@"%p:&globalStaticStr",&globalStaticStr);
    NSLog(@"%p:globalStaticStr",globalStaticStr);


    NSLog(@"%p:&globalConstStaticStr",&globalConstStaticStr);
    NSLog(@"%p:globalConstStaticStr",globalConstStaticStr);

    NSLog(@"%p:&localStaticStr",&localStaticStr);
    NSLog(@"%p:localStaticStr",localStaticStr);

    NSLog(@"%p:tmpLocalStr",tmpLocalStr);
    NSLog(@"%p:_string_copy",_string_copy);
    
    NSLog(@"%p:tmpLocalHeapStr",tmpLocalHeapStr);
    
    NSLog(@"%p:&DYSMemoryViewControllerExternPara",&DYSMemoryViewControllerExternPara);
    NSLog(@"%p:DYSMemoryViewControllerExternPara",DYSMemoryViewControllerExternPara);

    //code
    
    
    
    
    
    
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

//
//  DYSCopyViewController.m
//  MemoryManagementDemo
//
//  Created by 丁玉松 on 2018/10/31.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSCopyViewController.h"

@interface DYSCopyViewController ()

@property (nonatomic ,strong) NSString *string_strong;
@property (nonatomic ,strong) NSString *string_strong2;
@property (nonatomic ,weak) NSString *string_week;
@property (nonatomic ,assign) NSString *string_assign;
@property (nonatomic ,copy) NSString *string_copy;

@property (nonatomic ,retain) NSString *string_retain;

@property (nonatomic ,assign) NSInteger inteValue;

@end

@implementation DYSCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    //场景1 OC内程序内存分布。
    
    //初始化数据区 data 字符串常量@"121212"
    self.string_strong = @"originString";
    
    NSString *tmpStr = [NSString stringWithFormat:@"originString3"];
    self.string_strong2 = tmpStr;
    
    self.inteValue = 1;
    
    NSLog(@"%p:In data -121212",@"121212");
    NSLog(@"%p:In data -originString",self.string_strong);
    
    NSLog(@"%p:In heap -originString3",self.string_strong2);
    NSLog(@"%p:In heap -tmpStr",tmpStr);
    
    NSLog(@"%p:In heap -self",self);
    NSLog(@"%p:In heap -self.inteValue",&(_inteValue));
    NSLog(@"%p:In heap -&_string_strong",&_string_strong);
    
    NSLog(@"%p:In stack -&tmpStr:",&tmpStr);

    NSLog(@"%p:In heap -self.inteValue", _inteValue);

    /**
     输出：
     
     2018-11-01 18:15:49.109511+0800 MemoryManagementDemo[42214:2074548] 0x1097b50d0:In data -originString
     2018-11-01 18:15:49.109765+0800 MemoryManagementDemo[42214:2074548] 0x1097b50f0:In data -originString
     2018-11-01 18:15:49.109850+0800 MemoryManagementDemo[42214:2074548] 0x7fd96372cde0:In heap -self
     2018-11-01 18:15:49.109926+0800 MemoryManagementDemo[42214:2074548] 0x7fd96372d130:In heap -&_string_strong
     2018-11-01 18:15:49.110009+0800 MemoryManagementDemo[42214:2074548] 0x7ffee644a358:In stack -&tmpStr:
     2018-11-01 18:15:49.110087+0800 MemoryManagementDemo[42214:2074548] 0x600001f20960:In heap -tmpStr
     2018-11-01 18:15:49.110164+0800 MemoryManagementDemo[42214:2074548] 0x600001f20960:In heap -originString3
     2018-11-01 18:15:49.110238+0800 MemoryManagementDemo[42214:2074548] 0x7fd96372d160:In heap -self.inteValue
     2018-11-01 18:15:49.110346+0800 MemoryManagementDemo[42214:2074548] 0x1:In heap -self.inteValue
     2018-11-01 18:15:49.651874+0800 MemoryManagementDemo[42214:2074548] viewDidAppear:self.string_strong:0x600001f20960
     
     @"121212": 字符串常量存储在已初始化在数据区，从打印地址数据来看数据比较小可以推断出来。
     _string_strong和_inteValue: 类的成员变量，存储在堆区，self的成员变量，地址最高，和栈结构相关，在高地址。
     tmpStr：方法的局部变量，存储在栈区
     [NSString stringWithFormat:@"originString3"]:存储在堆区
     
     */
    
    
    
    
    
    
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear:self.string_strong:%p",self.string_strong);
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

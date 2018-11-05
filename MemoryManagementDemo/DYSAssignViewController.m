//
//  DYSAssignViewController.m
//  MemoryManagementDemo
//
//  Created by DingYusong on 2018/11/5.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSAssignViewController.h"
#import "DYSDog.h"

@interface DYSAssignViewController ()
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) DYSDog *dog;

@end

@implementation DYSAssignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DYSDog *dog = [DYSDog new];
    dog.name = @"欢欢";
    dog.age = 3;
    
    self.dog = dog;
    self.age = 12;
    NSLog(@"%p:self.dog",self.dog);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    /**
     assign一般用来修饰基本数据类型，整形，浮点型，bool。用来修饰OC类型容易造成野指针问题。
     week一般用来修饰OC对象，好处是引用对象引用计数为0的时候自动置为nil，不存在野指针问题。
     
     两者都不会对引用对象的引用计数产生影响。
     */
    
    NSLog(@"self.age:%ld",self.age);
    /**
     出现了野指针，报错
     Thread 1: EXC_BAD_ACCESS (code=1, address=0x7e8)
     */
    NSLog(@"%p:self.dog",self.dog);
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

//
//  DYSStrongViewController.m
//  MemoryManagementDemo
//
//  Created by 丁玉松 on 2018/11/2.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSStrongViewController.h"
#import "DYSDog.h"

@interface DYSStrongViewController ()
@property (nonatomic ,strong) NSMutableString *strongMutableString;
/**
 Property with 'retain (or strong)' attribute must be of object type
 strong 不能修饰非OC对象
 */
//@property (nonatomic ,strong) NSInteger strongInteger;
@property (nonatomic ,strong) DYSDog *strongDog;

@end

@implementation DYSStrongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"丁玉松"];
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(str)));

    self.strongMutableString = str;
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(str)));

    NSLog(@"%p:%@",str,str);
    NSLog(@"%p:%@",self.strongMutableString,self.strongMutableString);
    
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(str)));
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(self.strongMutableString)));

    [str appendString:@"哥哥"];
    NSLog(@"%p:%@",str,str);
    NSLog(@"%p:%@",self.strongMutableString,self.strongMutableString);

    str = @"小丁";
    NSLog(@"%p:%@",str,str);
    NSLog(@"%p:%@",self.strongMutableString,self.strongMutableString);

    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(self.strongMutableString)));

    /**
     
     1.strong只是对对象的引用，没有新增对象，属于地址拷贝。
     从下面两行可以看书地址完全相同。
     2018-11-03 22:12:10.541704+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松
     2018-11-03 22:12:10.541927+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松

     2.strong 不能修饰非OC对象。
     
     Property with 'retain (or strong)' attribute must be of object type
     strong 不能修饰非OC对象
     //@property (nonatomic ,strong) NSInteger strongInteger;
     
     3.因为是指针拷贝所以，对象在别的地方发生变化时，他同步受到影响会变化。所以最好不要用来修饰strong,dict,array,等除非你确实要使用这个特性。
     2018-11-03 22:12:10.542036+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松哥哥
     2018-11-03 22:12:10.542129+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松哥哥

     4.强引用使对象引用计数加一。
     所以在viewDidAppear里面self.strongMutableStringd所指向的对象引用计数不为0，所以不为nil。
     
     
     
     打印结果如下：
     2018-11-03 22:12:10.541704+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松
     2018-11-03 22:12:10.541927+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松
     2018-11-03 22:12:10.542036+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松哥哥
     2018-11-03 22:12:10.542129+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松哥哥
     2018-11-03 22:12:10.542214+0800 MemoryManagementDemo[14008:714130] 0x10c235658:小丁
     2018-11-03 22:12:10.542302+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松哥哥
     2018-11-03 22:12:11.087209+0800 MemoryManagementDemo[14008:714130] self.string_strong:bbbbcccc
     2018-11-03 22:12:11.087461+0800 MemoryManagementDemo[14008:714130] 0x60000083aa00:丁玉松哥哥
     */
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"self.string_strong:%@",self.strongString);

    NSLog(@"%p:%@",self.strongMutableString,self.strongMutableString);
    
    NSLog(@"retain  count = %ld\n",CFGetRetainCount((__bridge  CFTypeRef)(self.strongMutableString)));

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

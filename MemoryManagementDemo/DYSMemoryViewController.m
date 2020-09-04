//
//  DYSMemoryViewController.m
//  MemoryManagementDemo
//
//  Created by 丁玉松 on 2018/11/1.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSMemoryViewController.h"
#import "DYSCopyViewController.h"

NSString * const DYSParameterExternConst = @"extern";
NSString * const DYSParameterExternConst1 = @"extern1";
NSString * const DYSParameterExternConst2 = @"extern2";
NSString * const DYSParameterConst = @"iiii";
NSString * const DYSParameterConst1 = @"iiii1";
NSString * const DYSParameterConst2 = @"iiii2";
static NSString * const DYSParameterStaticConst = @"jjjj";
static NSString * const DYSParameterStaticConst1 = @"jjjj1";
static NSString * const DYSParameterStaticConst2 = @"jjjj2";
NSString *DYSParameter = @"kkkk";
NSString *DYSParameter1 = @"kkkk1";
NSString *DYSParameter2 = @"kkkk2";
static NSString *DYSParameterStatic = @"llll";
static NSString *DYSParameterStatic1 = @"llll1";
static NSString *DYSParameterStatic2 = @"llll2";


@interface DYSMemoryViewController ()

@property (nonatomic ,copy) NSString *string_copy;
@property (nonatomic ,strong) DYSCopyViewController *cVC;
@property (nonatomic ,strong) DYSCopyViewController *cVC2;

@property (nonatomic, copy) NSString *testStr;

@end

static NSString *globalStaticStrUnInit;


NSInteger globalInt = 10;
NSString *globalStr = @"aaaa";
static NSString *globalStaticStr = @"bbbb";
const static NSString *globalConstStaticStr = @"cccc";

@implementation DYSMemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self yyi_testAllArea];
//    [self yyi_testDataArea];
//    [self yyi_testString];
}

- (void)yyi_testAllArea{
    //    DYSParameterConst = @"iiii";
    
    
    static NSString *localStaticStr = @"dddd";
    NSString *tmpLocalStr = @"eeee";
    _string_copy = tmpLocalStr;
    
    NSString *tmpLocalHeapStr = @"ffff";
    
    NSString *tmpLocalHeapStr2 = [NSString stringWithFormat:@"gggg"];
    
    NSObject *obj = [NSObject new];
    
    self.cVC = [[DYSCopyViewController alloc] init];
    self.cVC2 = [[DYSCopyViewController alloc] init];
    
    
    globalStaticStrUnInit = @"hhhh";
    
    
    NSLog(@"%p:tmpLocalHeapStr2",tmpLocalHeapStr2);
    
    //stack
    NSLog(@"%p:&tmpLocalStr",&tmpLocalStr);
    NSLog(@"%p:&tmpLocalHeapStr",&tmpLocalHeapStr);
    NSLog(@"%p:&tmpLocalHeapStr2",&tmpLocalHeapStr2);
    NSLog(@"%p:&obj",&obj);
    NSLog(@"\n");
    
    //heap
    NSLog(@"%p:self.cVC2",self.cVC2);
    NSLog(@"%p:self.cVC",self.cVC);
    NSLog(@"\n");
    
    NSLog(@"%p:&_cVC2",&_cVC2);
    NSLog(@"%p:&_string_copy",&_string_copy);
    NSLog(@"%p:&_cVC",&_cVC);
    NSLog(@"%p:self",self);
    NSLog(@"\n");
    
    NSLog(@"%p:obj",obj);
    NSLog(@"\n");
    
    
    //bss
    NSLog(@"%p:&globalStaticStrUnInit",&globalStaticStrUnInit);
    NSLog(@"\n");
    
    
    //data
    NSLog(@"%p:&localStaticStr",&localStaticStr);
    NSLog(@"%p:&globalConstStaticStr",&globalConstStaticStr);
    NSLog(@"%p:&globalStaticStr",&globalStaticStr);
    NSLog(@"%p:&globalInt",&globalInt);
    NSLog(@"%p:&globalStr",&globalStr);
    NSLog(@"\n");
    
    NSLog(@"%p:globalStaticStrUnInit",globalStaticStrUnInit);
    NSLog(@"%p:tmpLocalHeapStr",tmpLocalHeapStr);
    NSLog(@"%p:tmpLocalStr",tmpLocalStr);
    NSLog(@"%p:_string_copy",_string_copy);
    NSLog(@"%p:localStaticStr",localStaticStr);
    NSLog(@"%p:globalConstStaticStr",globalConstStaticStr);
    NSLog(@"%p:globalStaticStr",globalStaticStr);
    NSLog(@"%p:globalStr",globalStr);
    NSLog(@"%p:DYSParameterExternConst",DYSParameterExternConst);
    NSLog(@"%p:&DYSParameterExternConst",&DYSParameterExternConst);
    NSLog(@"\n");
    //code
    
    
    
    /*
     2018-11-02 11:06:46.571497+0800 MemoryManagementDemo[55133:2626805] 0xca19605b9116f830:tmpLocalHeapStr2
     
     1：栈区，栈结构往低地址增长，，后申请的对象比先申请的对象地址低。
     2018-11-02 11:25:19.467958+0800 MemoryManagementDemo[55538:2662367] 0x80fb049dec7d364f:tmpLocalHeapStr2
     2018-11-02 11:25:19.468368+0800 MemoryManagementDemo[55538:2662367] 0x7ffee2806358:&tmpLocalStr
     2018-11-02 11:25:19.468702+0800 MemoryManagementDemo[55538:2662367] 0x7ffee2806350:&tmpLocalHeapStr
     2018-11-02 11:25:19.468815+0800 MemoryManagementDemo[55538:2662367] 0x7ffee2806348:&tmpLocalHeapStr2
     2018-11-02 11:25:19.468921+0800 MemoryManagementDemo[55538:2662367] 0x7ffee2806340:&obj
     
     2：堆区，堆结构往高地址方向增长，后申请的对象比先申请的对象地址高。
     2018-11-02 11:25:19.469110+0800 MemoryManagementDemo[55538:2662367] 0x7fb88dd0adc0:self.cVC2
     2018-11-02 11:25:19.469234+0800 MemoryManagementDemo[55538:2662367] 0x7fb88dd0a800:self.cVC
     2018-11-02 11:25:19.469426+0800 MemoryManagementDemo[55538:2662367]
     2018-11-02 11:25:19.469731+0800 MemoryManagementDemo[55538:2662367] 0x7fb88dd09ca0:&_cVC2
     2018-11-02 11:25:19.470028+0800 MemoryManagementDemo[55538:2662367] 0x7fb88dd09c90:&_string_copy
     2018-11-02 11:25:19.470253+0800 MemoryManagementDemo[55538:2662367] 0x7fb88dd09c98:&_cVC
     2018-11-02 11:25:19.470450+0800 MemoryManagementDemo[55538:2662367] 0x7fb88dd09940:self
     2018-11-02 11:25:19.470863+0800 MemoryManagementDemo[55538:2662367]
     2018-11-02 11:25:19.471597+0800 MemoryManagementDemo[55538:2662367] 0x600001662bf0:obj
     
     3.1：BSS未初始化数据区，存储未初始化的静态变量，全局变量。
     //未初始化 全局和静态变量
     2018-11-02 11:25:19.472943+0800 MemoryManagementDemo[55538:2662367] 0x10d3fc8f8:&globalStaticStrUnInit
     2018-11-02 11:25:19.473372+0800 MemoryManagementDemo[55538:2662367]
     
     3.2：DATA初始化数据区，存储初始化的静态变量，全局变量和常量。
     按照如下顺序进入内存
     1.头文件中全局变量
     2.常量
     3.已经初始化的 普通全局和静态全局变量
     4.未初始化 全局和静态变量
     
     //已经初始化的 全局和静态变量
     2018-11-02 11:25:19.498760+0800 MemoryManagementDemo[55538:2662367] 0x10d3fc8f0:&localStaticStr
     2018-11-02 11:25:19.498896+0800 MemoryManagementDemo[55538:2662367] 0x10d3fc8e8:&globalConstStaticStr
     2018-11-02 11:25:19.498997+0800 MemoryManagementDemo[55538:2662367] 0x10d3fc8e0:&globalStaticStr
     2018-11-02 11:25:19.499083+0800 MemoryManagementDemo[55538:2662367] 0x10d3fc8d0:&globalInt
     2018-11-02 11:25:19.499166+0800 MemoryManagementDemo[55538:2662367] 0x10d3fc8d8:&globalStr
     2018-11-02 11:25:19.499247+0800 MemoryManagementDemo[55538:2662367]
     //常量
     2018-11-02 11:25:19.499361+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa418:globalStaticStrUnInit
     2018-11-02 11:25:19.499669+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa3d8:tmpLocalHeapStr
     2018-11-02 11:25:19.499984+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa3b8:tmpLocalStr
     2018-11-02 11:25:19.500270+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa3b8:_string_copy
     2018-11-02 11:25:19.500544+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa398:localStaticStr
     2018-11-02 11:25:19.500804+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa378:globalConstStaticStr
     2018-11-02 11:25:19.501073+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa358:globalStaticStr
     2018-11-02 11:25:19.501381+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa338:globalStr
     2018-11-02 11:25:19.501664+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa318:DYSParameterExternConst
     
     //全局作用域变量
     2018-11-02 11:25:19.501935+0800 MemoryManagementDemo[55538:2662367] 0x10d3fa0b0:&DYSParameterExternConst
     2018-11-02 11:25:19.502269+0800 MemoryManagementDemo[55538:2662367]
     */
    
    
    /*
     变量：
     全局变量：普通全局变量和静态全局变量
     局部变量：静态局部变量和普通局部变量
     常量：
     存储在数据区
     */

}

static NSString *DYSParameterIMPStatic = @"LLLL";
static NSString *DYSParameterIMPStaticNoInit;
const static NSString *DYSParameterIMPStaticConst = @"oooo";

NSString *DYSParameterIMP = @"MMMM";
NSString *DYSParameterIMPNoInit;
const NSString *DYSParameterIMPConst = @"pppp";

const NSString *DYSParameterIMPConstNoInit;

const static NSString *DYSParameterIMPConstStaticNoInit;

-(void)yyi_testDataArea{
    /**
     数据区分为BSS未初始化数据区和DATA初始化数据区。
     1：BSS未初始化数据区，存储未初始化的静态变量，全局变量。
     BSS 段（bss segment ）通常是指用来存放程序中未初始化的全局变量的一块内存区域。BSS 是英文Block Started by Symbol 的简称。BSS 段属于静态内存分配，即程序一开始就将其清零了。一般在初始化时BSS段部分将会清零。
     
     2：DATA初始化数据区，存储初始化的静态变量，全局变量和常量。
     数据段（data segment ）通常是指用来存放程序中已初始化的全局变量的一块内存区域。数据段属于静态内存分配。data段中的静态数据区存放的是程序中已初始化的全局变量、静态变量和常量。
     
     3.BSS段在高地质，DATA段在低地址。
     
     
     
     
     4.同种类型的变量，先声明的在低地址，后声明的在高地址。
     
     5.const：不管是否初始化，const修饰的变量地址在非const修饰的变量之前。const优先分配内存。
     
     6.常量在const变量和非const变量之间分配c内存，按照声明的顺序分配。
     
     7.对于已经初始化的全局变量  static修饰符不会改变其内存分配顺序。
     2018-11-02 14:56:07.947945+0800 MemoryManagementDemo[59235:2909275] 0x10ff19118:&DYSParameter
     2018-11-02 14:56:07.948080+0800 MemoryManagementDemo[59235:2909275] 0x10ff19120:&DYSParameter1
     2018-11-02 14:56:07.948228+0800 MemoryManagementDemo[59235:2909275] 0x10ff19128:&DYSParameter2
     2018-11-02 14:56:07.948355+0800 MemoryManagementDemo[59235:2909275] 0x10ff19130:&DYSParameterStatic
     2018-11-02 14:56:07.948500+0800 MemoryManagementDemo[59235:2909275] 0x10ff19138:&DYSParameterStatic1
     2018-11-02 14:56:07.948659+0800 MemoryManagementDemo[59235:2909275] 0x10ff19140:&DYSParameterStatic2
     
     8.对于未初始化的全局变量，static修饰的变量会提前分配内存。
     2018-11-02 14:56:07.949040+0800 MemoryManagementDemo[59235:2909275] 0x10ff19178:&DYSParameterStaticNoInit
     2018-11-02 14:56:07.949129+0800 MemoryManagementDemo[59235:2909275] 0x10ff19180:&DYSParameterStaticNoInit1
     2018-11-02 14:56:07.949265+0800 MemoryManagementDemo[59235:2909275] 0x10ff19188:&DYSParameterStaticNoInit2
     2018-11-02 14:56:07.949504+0800 MemoryManagementDemo[59235:2909275] 0x10ff19190:&DYSParameterNoInit
     2018-11-02 14:56:07.949758+0800 MemoryManagementDemo[59235:2909275] 0x10ff19198:&DYSParameterNoInit1
     2018-11-02 14:56:07.949989+0800 MemoryManagementDemo[59235:2909275] 0x10ff191a0:&DYSParameterNoInit2

     9.常量会按照声明的顺序来分配内存。
     2018-11-02 14:56:07.936853+0800 MemoryManagementDemo[59235:2909275] 0x10ff16358:DYSParameterExternConst
     2018-11-02 14:56:07.946100+0800 MemoryManagementDemo[59235:2909275] 0x10ff16378:DYSParameterExternConst1
     2018-11-02 14:56:07.946192+0800 MemoryManagementDemo[59235:2909275] 0x10ff16398:DYSParameterExternConst2
     2018-11-02 14:56:07.946268+0800 MemoryManagementDemo[59235:2909275] 0x10ff163b8:DYSParameterConst
     2018-11-02 14:56:07.946344+0800 MemoryManagementDemo[59235:2909275] 0x10ff163d8:DYSParameterConst1
     2018-11-02 14:56:07.946414+0800 MemoryManagementDemo[59235:2909275] 0x10ff163f8:DYSParameterConst2
     2018-11-02 14:56:07.946482+0800 MemoryManagementDemo[59235:2909275] 0x10ff16418:DYSParameterStaticConst
     2018-11-02 14:56:07.946554+0800 MemoryManagementDemo[59235:2909275] 0x10ff16438:DYSParameterStaticConst1
     2018-11-02 14:56:07.946624+0800 MemoryManagementDemo[59235:2909275] 0x10ff16458:DYSParameterStaticConst2
     2018-11-02 14:56:07.946694+0800 MemoryManagementDemo[59235:2909275] 0x10ff16478:DYSParameter
     2018-11-02 14:56:07.946891+0800 MemoryManagementDemo[59235:2909275] 0x10ff16498:DYSParameter1
     2018-11-02 14:56:07.947125+0800 MemoryManagementDemo[59235:2909275] 0x10ff164b8:DYSParameter2
     2018-11-02 14:56:07.947363+0800 MemoryManagementDemo[59235:2909275] 0x10ff164d8:DYSParameterStatic
     2018-11-02 14:56:07.947526+0800 MemoryManagementDemo[59235:2909275] 0x10ff164f8:DYSParameterStatic1
     2018-11-02 14:56:07.947684+0800 MemoryManagementDemo[59235:2909275] 0x10ff16518:DYSParameterStatic2

     
     
     */
    
    static NSString *DYSParameterIMPLocalStatic = @"rrrr";
    const static NSString *DYSParameterIMPLocalStaticConst = @"nnnn";
    
    
    //变量-----------------------------------
    //header文件里面的全局变量--注意：const的 noInit先分配内存。
    NSLog(@"%p:&DYSParameterConstNoInit",&DYSParameterConstNoInit);
    NSLog(@"%p:&DYSParameterConstNoInit1",&DYSParameterConstNoInit1);
    NSLog(@"%p:&DYSParameterConstNoInit2",&DYSParameterConstNoInit2);
    NSLog(@"%p:&DYSParameterStaticConstNoInit",&DYSParameterStaticConstNoInit);
    NSLog(@"%p:&DYSParameterStaticConstNoInit1",&DYSParameterStaticConstNoInit1);
    NSLog(@"%p:&DYSParameterStaticConstNoInit2",&DYSParameterStaticConstNoInit2);

    NSLog(@"%p:&DYSParameterExternConst",&DYSParameterExternConst);
    NSLog(@"%p:&DYSParameterExternConst1",&DYSParameterExternConst1);
    NSLog(@"%p:&DYSParameterExternConst2",&DYSParameterExternConst2);
    NSLog(@"%p:&DYSParameterConst",&DYSParameterConst);
    NSLog(@"%p:&DYSParameterConst1",&DYSParameterConst1);
    NSLog(@"%p:&DYSParameterConst2",&DYSParameterConst2);
    NSLog(@"%p:&DYSParameterStaticConst",&DYSParameterStaticConst);
    NSLog(@"%p:&DYSParameterStaticConst1",&DYSParameterStaticConst1);
    NSLog(@"%p:&DYSParameterStaticConst2",&DYSParameterStaticConst2);
    
    
    NSLog(@"\n");
    
    
    
    //常量-----------------------------------
    //完全按照声明的顺序分配
    
    NSLog(@"%p:DYSParameterExternConst",DYSParameterExternConst);
    NSLog(@"%p:DYSParameterExternConst1",DYSParameterExternConst1);
    NSLog(@"%p:DYSParameterExternConst2",DYSParameterExternConst2);
    NSLog(@"%p:DYSParameterConst",DYSParameterConst);
    NSLog(@"%p:DYSParameterConst1",DYSParameterConst1);
    NSLog(@"%p:DYSParameterConst2",DYSParameterConst2);
    NSLog(@"%p:DYSParameterStaticConst",DYSParameterStaticConst);
    NSLog(@"%p:DYSParameterStaticConst1",DYSParameterStaticConst1);
    NSLog(@"%p:DYSParameterStaticConst2",DYSParameterStaticConst2);
    NSLog(@"%p:DYSParameter",DYSParameter);
    NSLog(@"%p:DYSParameter1",DYSParameter1);
    NSLog(@"%p:DYSParameter2",DYSParameter2);
    NSLog(@"%p:DYSParameterStatic",DYSParameterStatic);
    NSLog(@"%p:DYSParameterStatic1",DYSParameterStatic1);
    NSLog(@"%p:DYSParameterStatic2",DYSParameterStatic2);

    NSLog(@"\n");

    
    // 局部
    NSLog(@"%p:DYSParameterIMPStatic",DYSParameterIMPStatic);
    NSLog(@"%p:DYSParameterIMPStaticConst",DYSParameterIMPStaticConst);
    NSLog(@"%p:DYSParameterIMP",DYSParameterIMP);
    NSLog(@"%p:DYSParameterIMPConst",DYSParameterIMPConst);
    NSLog(@"%p:DYSParameterIMPLocalStatic",DYSParameterIMPLocalStatic);
    NSLog(@"%p:DYSParameterIMPLocalStaticConst",DYSParameterIMPLocalStaticConst);

    
    
    NSLog(@"\n");
    
    
    //变量-----------------------------------

    // no init的变量最后分配内存，对应之前说的BSS段。
    //如果不实例化extern声明的全局变量，编译会出错。
    //    NSLog(@"%p:DYSParameterExternConstNoInit",DYSParameterExternConstNoInit);
    //    NSLog(@"%p:&DYSParameterExternConstNoInit",&DYSParameterExternConstNoInit);
    NSLog(@"%p:&DYSParameter",&DYSParameter);
    NSLog(@"%p:&DYSParameter1",&DYSParameter1);
    NSLog(@"%p:&DYSParameter2",&DYSParameter2);

    NSLog(@"%p:&DYSParameterStatic",&DYSParameterStatic);
    NSLog(@"%p:&DYSParameterStatic1",&DYSParameterStatic1);
    NSLog(@"%p:&DYSParameterStatic2",&DYSParameterStatic2);
    
    
    
    NSLog(@"%p:&DYSParameterIMPStatic",&DYSParameterIMPStatic);
    NSLog(@"%p:&DYSParameterIMPStaticConst",&DYSParameterIMPStaticConst);
    NSLog(@"%p:&DYSParameterIMP",&DYSParameterIMP);
    //实现文件内const修饰的全局变量
    NSLog(@"%p:&DYSParameterIMPConst",&DYSParameterIMPConst);
    NSLog(@"%p:&DYSParameterIMPLocalStatic",&DYSParameterIMPLocalStatic);
    NSLog(@"%p:&DYSParameterIMPLocalStaticConst",&DYSParameterIMPLocalStaticConst);


    NSLog(@"%p:&DYSParameterStaticNoInit",&DYSParameterStaticNoInit);
    NSLog(@"%p:&DYSParameterStaticNoInit1",&DYSParameterStaticNoInit1);
    NSLog(@"%p:&DYSParameterStaticNoInit2",&DYSParameterStaticNoInit2);

    NSLog(@"%p:&DYSParameterIMPConstStaticNoInit",&DYSParameterIMPConstStaticNoInit);
    NSLog(@"%p:&DYSParameterIMPStaticNoInit",&DYSParameterIMPStaticNoInit);

    NSLog(@"%p:&DYSParameterNoInit",&DYSParameterNoInit);
    NSLog(@"%p:&DYSParameterNoInit1",&DYSParameterNoInit1);
    NSLog(@"%p:&DYSParameterNoInit2",&DYSParameterNoInit2);
    
    NSLog(@"%p:&DYSParameterIMPConstNoInit",&DYSParameterIMPConstNoInit);
    NSLog(@"%p:&DYSParameterIMPNoInit",&DYSParameterIMPNoInit);
    
    
    NSLog(@"\n");
/**
 
 2018-11-02 15:49:31.477629+0800 MemoryManagementDemo[60408:3019917] 0x1060a6de8:&DYSParameterConstNoInit
 2018-11-02 15:49:31.477812+0800 MemoryManagementDemo[60408:3019917] 0x1060a6df0:&DYSParameterConstNoInit1
 2018-11-02 15:49:31.477908+0800 MemoryManagementDemo[60408:3019917] 0x1060a6df8:&DYSParameterConstNoInit2
 2018-11-02 15:49:31.478026+0800 MemoryManagementDemo[60408:3019917] 0x1060a6e00:&DYSParameterStaticConstNoInit
 2018-11-02 15:49:31.478158+0800 MemoryManagementDemo[60408:3019917] 0x1060a6e08:&DYSParameterStaticConstNoInit1
 2018-11-02 15:49:31.478248+0800 MemoryManagementDemo[60408:3019917] 0x1060a6e10:&DYSParameterStaticConstNoInit2
 2018-11-02 15:49:31.478332+0800 MemoryManagementDemo[60408:3019917] 0x1060a70b0:&DYSParameterExternConst
 2018-11-02 15:49:31.478428+0800 MemoryManagementDemo[60408:3019917] 0x1060a70b8:&DYSParameterExternConst1
 2018-11-02 15:49:31.478512+0800 MemoryManagementDemo[60408:3019917] 0x1060a70c0:&DYSParameterExternConst2
 2018-11-02 15:49:31.478601+0800 MemoryManagementDemo[60408:3019917] 0x1060a70c8:&DYSParameterConst
 2018-11-02 15:49:31.478692+0800 MemoryManagementDemo[60408:3019917] 0x1060a70d0:&DYSParameterConst1
 2018-11-02 15:49:31.478920+0800 MemoryManagementDemo[60408:3019917] 0x1060a70d8:&DYSParameterConst2
 2018-11-02 15:49:31.479191+0800 MemoryManagementDemo[60408:3019917] 0x1060a70e0:&DYSParameterStaticConst
 2018-11-02 15:49:31.479421+0800 MemoryManagementDemo[60408:3019917] 0x1060a70e8:&DYSParameterStaticConst1
 2018-11-02 15:49:31.479642+0800 MemoryManagementDemo[60408:3019917] 0x1060a70f0:&DYSParameterStaticConst2
 2018-11-02 15:49:31.479905+0800 MemoryManagementDemo[60408:3019917]
 2018-11-02 15:49:31.480065+0800 MemoryManagementDemo[60408:3019917] 0x1060a7358:DYSParameterExternConst
 2018-11-02 15:49:31.480301+0800 MemoryManagementDemo[60408:3019917] 0x1060a7378:DYSParameterExternConst1
 2018-11-02 15:49:31.480534+0800 MemoryManagementDemo[60408:3019917] 0x1060a7398:DYSParameterExternConst2
 2018-11-02 15:49:31.480761+0800 MemoryManagementDemo[60408:3019917] 0x1060a73b8:DYSParameterConst
 2018-11-02 15:49:31.491245+0800 MemoryManagementDemo[60408:3019917] 0x1060a73d8:DYSParameterConst1
 2018-11-02 15:49:31.491393+0800 MemoryManagementDemo[60408:3019917] 0x1060a73f8:DYSParameterConst2
 2018-11-02 15:49:31.491498+0800 MemoryManagementDemo[60408:3019917] 0x1060a7418:DYSParameterStaticConst
 2018-11-02 15:49:31.491616+0800 MemoryManagementDemo[60408:3019917] 0x1060a7438:DYSParameterStaticConst1
 2018-11-02 15:49:31.491707+0800 MemoryManagementDemo[60408:3019917] 0x1060a7458:DYSParameterStaticConst2
 2018-11-02 15:49:31.491789+0800 MemoryManagementDemo[60408:3019917] 0x1060a7478:DYSParameter
 2018-11-02 15:49:31.491863+0800 MemoryManagementDemo[60408:3019917] 0x1060a7498:DYSParameter1
 2018-11-02 15:49:31.491979+0800 MemoryManagementDemo[60408:3019917] 0x1060a74b8:DYSParameter2
 2018-11-02 15:49:31.492232+0800 MemoryManagementDemo[60408:3019917] 0x1060a74d8:DYSParameterStatic
 2018-11-02 15:49:31.492511+0800 MemoryManagementDemo[60408:3019917] 0x1060a74f8:DYSParameterStatic1
 2018-11-02 15:49:31.492782+0800 MemoryManagementDemo[60408:3019917] 0x1060a7518:DYSParameterStatic2
 2018-11-02 15:49:31.493050+0800 MemoryManagementDemo[60408:3019917]
 2018-11-02 15:49:31.493326+0800 MemoryManagementDemo[60408:3019917] 0x1060a79d8:DYSParameterIMPStatic
 2018-11-02 15:49:31.493574+0800 MemoryManagementDemo[60408:3019917] 0x1060a79f8:DYSParameterIMPStaticConst
 2018-11-02 15:49:31.493820+0800 MemoryManagementDemo[60408:3019917] 0x1060a7a18:DYSParameterIMP
 2018-11-02 15:49:31.494221+0800 MemoryManagementDemo[60408:3019917] 0x1060a7a38:DYSParameterIMPConst
 2018-11-02 15:49:31.494473+0800 MemoryManagementDemo[60408:3019917] 0x1060a7a58:DYSParameterIMPLocalStatic
 2018-11-02 15:49:31.494733+0800 MemoryManagementDemo[60408:3019917] 0x1060a7a78:DYSParameterIMPLocalStaticConst
 2018-11-02 15:49:31.494992+0800 MemoryManagementDemo[60408:3019917]
 2018-11-02 15:49:31.495232+0800 MemoryManagementDemo[60408:3019917] 0x1060aa3d8:&DYSParameter
 2018-11-02 15:49:31.495579+0800 MemoryManagementDemo[60408:3019917] 0x1060aa3e0:&DYSParameter1
 2018-11-02 15:49:31.495845+0800 MemoryManagementDemo[60408:3019917] 0x1060aa3e8:&DYSParameter2
 2018-11-02 15:49:31.496091+0800 MemoryManagementDemo[60408:3019917] 0x1060aa3f0:&DYSParameterStatic
 2018-11-02 15:49:31.496328+0800 MemoryManagementDemo[60408:3019917] 0x1060aa3f8:&DYSParameterStatic1
 2018-11-02 15:49:31.496579+0800 MemoryManagementDemo[60408:3019917] 0x1060aa400:&DYSParameterStatic2
 2018-11-02 15:49:31.496849+0800 MemoryManagementDemo[60408:3019917] 0x1060aa430:&DYSParameterIMPStatic
 2018-11-02 15:49:31.497166+0800 MemoryManagementDemo[60408:3019917] 0x1060aa438:&DYSParameterIMPStaticConst
 2018-11-02 15:49:31.497428+0800 MemoryManagementDemo[60408:3019917] 0x1060aa440:&DYSParameterIMP
 2018-11-02 15:49:31.497704+0800 MemoryManagementDemo[60408:3019917] 0x1060aa448:&DYSParameterIMPConst
 2018-11-02 15:49:31.497973+0800 MemoryManagementDemo[60408:3019917] 0x1060aa450:&DYSParameterIMPLocalStatic
 2018-11-02 15:49:31.498241+0800 MemoryManagementDemo[60408:3019917] 0x1060aa458:&DYSParameterIMPLocalStaticConst
 2018-11-02 15:49:31.498507+0800 MemoryManagementDemo[60408:3019917] 0x1060aa468:&DYSParameterStaticNoInit
 2018-11-02 15:49:31.498724+0800 MemoryManagementDemo[60408:3019917] 0x1060aa470:&DYSParameterStaticNoInit1
 2018-11-02 15:49:31.498988+0800 MemoryManagementDemo[60408:3019917] 0x1060aa478:&DYSParameterStaticNoInit2
 2018-11-02 15:49:31.499230+0800 MemoryManagementDemo[60408:3019917] 0x1060aa480:&DYSParameterIMPConstStaticNoInit
 2018-11-02 15:49:31.499504+0800 MemoryManagementDemo[60408:3019917] 0x1060aa488:&DYSParameterIMPStaticNoInit
 2018-11-02 15:49:31.499816+0800 MemoryManagementDemo[60408:3019917] 0x1060aa490:&DYSParameterNoInit
 2018-11-02 15:49:31.500088+0800 MemoryManagementDemo[60408:3019917] 0x1060aa498:&DYSParameterNoInit1
 2018-11-02 15:49:31.500350+0800 MemoryManagementDemo[60408:3019917] 0x1060aa4a0:&DYSParameterNoInit2
 2018-11-02 15:49:31.500573+0800 MemoryManagementDemo[60408:3019917] 0x1060aa4a8:&DYSParameterIMPConstNoInit
 2018-11-02 15:49:31.500789+0800 MemoryManagementDemo[60408:3019917] 0x1060aa4b0:&DYSParameterIMPNoInit

 
 */
}

- (void)yyi_testString{
    
    
    NSString *test1 = [[NSString alloc] initWithString:@"123"];
    NSString *test2 = @"123";
    NSString *test3 = [NSString stringWithFormat:@"123"];
    NSMutableString *test4 = [[NSMutableString alloc] initWithString:@"123"];
    NSString *test5 = [test4 copy];
    NSString *test6 = [NSString stringWithFormat:@"%@", @"123"];
    self.testStr = [test2 copy];
    
    
    NSLog(@"%p:test1",test1);
    NSLog(@"%p:test2",test2);
    NSLog(@"%p:test3",test3);
    NSLog(@"%p:test4",test4);
    NSLog(@"%p:test5",test5);
    NSLog(@"%p:test6",test6);
    NSLog(@"%p:self.testStr",self.testStr);
    
    /*
     2018-11-02 16:08:48.985628+0800 MemoryManagementDemo[60880:3055059] 0x10d2c7198:test1
     2018-11-02 16:08:48.985758+0800 MemoryManagementDemo[60880:3055059] 0x10d2c7198:test2
     2018-11-02 16:08:48.985854+0800 MemoryManagementDemo[60880:3055059] 0xf2eabe469c89ce57:test3
     2018-11-02 16:08:48.985948+0800 MemoryManagementDemo[60880:3055059] 0x6000039bbea0:test4
     2018-11-02 16:08:48.986025+0800 MemoryManagementDemo[60880:3055059] 0xf2eabe469c89ce57:test5
     2018-11-02 16:08:48.986102+0800 MemoryManagementDemo[60880:3055059] 0xf2eabe469c89ce57:test6
     2018-11-02 16:08:48.986185+0800 MemoryManagementDemo[60880:3055059] 0x10d2c7198:self.testStr
     */
    
    /*
     分析： 3，5，6的类型都是NSTaggedPointerString 打印出的地址一样都是0xf2eabe469c89ce57 非常高。其实不是地址而是字面量。所以他们的值是相同的。
     
     4.可变字符串 是从堆中开辟空间获取的。
     
     1，2和self.testStr 是一样，y是因为都是字符串常量。在Data段分配。这种现象对应设计模式中的享元模式。
     
     */
    
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

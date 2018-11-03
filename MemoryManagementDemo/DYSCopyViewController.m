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


@property (nonatomic ,retain) NSString *string_retain;

@property (nonatomic ,assign) NSInteger inteValue;


@property (nonatomic ,copy) NSString *stringCopy;
@property (nonatomic ,copy) NSMutableString *mutableStringCopy;

@end

@implementation DYSCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /**
     对非集合类对象的copy操作
     
     因为父类指针可以指向子类对象,使用 copy 的目的是为了让本对象的属性不受外界影响,使用 copy 无论给我传入是一个可变对象还是不可对象,我本身持有的就是一个不可变的副本.
     在非集合类对象中：对 immutable 对象进行 copy 操作，是指针复制，mutableCopy 操作时内容复制；对 mutable 对象进行 copy 和 mutableCopy 都是内容复制。
     
     总结一句，copy，最后都是持有不可变对象的指针。mutable 最后都是持有可变对象的指针。
     
     对象的类型和指向对象的指针类型，没有什么关联。
     
     */
//    [self yyi_copyAndMutableCopy];
//    [self yyi_copyImmutableObjToImmutableObj];
//    [self yyi_copyImmutableObjToMutableObj];
//    [self yyi_copyMutableObjToImmutableObj];
//    [self yyi_copyMutableObjToMutableObj];
 
    
    /**
     集合类对象copy操作。
     */
    
//    [self yyi_yyi_copyAndMutableCopyCollection];
    [self yyi_yyi_deepCopyAndMutableCopyCollection];
}

#pragma mark - 对非集合类对象的copy操作
//总结一句，是要是copy修饰符，最后都是持有不可变对象的指针。


/**
 
 指针
 
 2018-11-03 16:37:18.785915+0800 MemoryManagementDemo[6585:343085] 0x10edc10f8:immutableStr
 2018-11-03 16:37:18.786225+0800 MemoryManagementDemo[6585:343085] 0x10edc10f8:stringCopy
 2018-11-03 16:37:18.786309+0800 MemoryManagementDemo[6585:343085] 0x6000002a5140:stringMutableCopy
 2018-11-03 16:37:18.786395+0800 MemoryManagementDemo[6585:343085] 0x10edc10f8:mutableStringCopy
 2018-11-03 16:37:18.786490+0800 MemoryManagementDemo[6585:343085] 0x6000002a7cc0:mutableStringMutableCopy
 2018-11-03 16:37:18.786570+0800 MemoryManagementDemo[6585:343085]
 2018-11-03 16:37:18.786672+0800 MemoryManagementDemo[6585:343085] 0x6000002fffc0:mutableStr
 2018-11-03 16:37:18.786754+0800 MemoryManagementDemo[6585:343085] 0xe9ea21dc0e74e364:stringCopyMutableStr
 2018-11-03 16:37:18.787041+0800 MemoryManagementDemo[6585:343085] 0x6000002fd710:stringMutableCopyMutableStr
 2018-11-03 16:37:18.787275+0800 MemoryManagementDemo[6585:343085] 0xe9ea21dc0e74e364:mutableStringCopyMutableStr
 2018-11-03 16:37:18.787494+0800 MemoryManagementDemo[6585:343085] 0x6000002fc480:mutableStringMutableCopyMutableStr
*/
- (void)yyi_copyAndMutableCopy{
    
    NSString *immutableStr  = @"aaaa";
    NSString *stringCopy = [immutableStr copy];
    NSString *stringMutableCopy = [immutableStr mutableCopy];
    NSMutableString *mutableStringCopy = [immutableStr copy];
    NSMutableString *mutableStringMutableCopy = [immutableStr mutableCopy];
    
    NSLog(@"%p:immutableStr",immutableStr);
    NSLog(@"%p:stringCopy",stringCopy);
    NSLog(@"%p:stringMutableCopy",stringMutableCopy);
    NSLog(@"%p:mutableStringCopy",mutableStringCopy);
    NSLog(@"%p:mutableStringMutableCopy",mutableStringMutableCopy);
    NSLog(@"\n");
    
    NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:@"bbbb"];
    NSString *stringCopyMutableStr = [mutableStr copy];
    NSString *stringMutableCopyMutableStr = [mutableStr mutableCopy];
    NSMutableString *mutableStringCopyMutableStr = [mutableStr copy];
    NSMutableString *mutableStringMutableCopyMutableStr = [mutableStr mutableCopy];
    
    NSLog(@"%p:mutableStr",mutableStr);
    NSLog(@"%p:stringCopyMutableStr",stringCopyMutableStr);
    NSLog(@"%p:stringMutableCopyMutableStr",stringMutableCopyMutableStr);
    NSLog(@"%p:mutableStringCopyMutableStr",mutableStringCopyMutableStr);
    NSLog(@"%p:mutableStringMutableCopyMutableStr",mutableStringMutableCopyMutableStr);
    NSLog(@"\n");
    
    
    /**
     MutableCopy 出来的都是__NSCFString 类型（如下：mutableStringMutableCopy和mutableStringMutableCopyMutableStr）。
     Copy 出来的是__NSCFConstantString 和 NSTaggedPointerString 类型 ，都是不可变类型（如下：mutableStringCopy和mutableStringCopyMutableStr）
     
     由此可以得出：
     1.指针类型和对象类型没有什么关联。
        指针类型是用户指定的，完全有可能那一个不可变类型指向了一个可变类型。例如：stringMutableCopyMutableStr 也可能用一个可变类型指针指向了一个不可变类型，例如： mutableStringCopyMutableStr。
     2.对象类型和对象的生成有关系。
        init方法或者一些其他的方法等，例如：copy方法返回的是不可变对象指针，MutableCopy 返回的是可变对象指针。
     */
    
    //[mutableStringCopy appendString:@"121212"];// Crash mutableStringCopy    __NSCFConstantString *    @"aaaa"    0x00000001075cb0f8
    [mutableStringMutableCopy appendString:@"121212"];// NO Crash mutableStringMutableCopy    __NSCFString *    @"aaaa121212"    0x0000600001cffb40
    //    [mutableStringCopyMutableStr appendString:@"121212"];// Crash mutableStringCopyMutableStr    NSTaggedPointerString *    @"bbbb"    0xf2aa078440d3ebb4
    [mutableStringMutableCopyMutableStr appendString:@"121212"];// NO Crash mutableStringMutableCopyMutableStr    __NSCFString *    @"bbbb121212"    0x0000600000299c50

}

/**
 copy  不可变到不可变
 
 
 场景1：将一个不可变NSString对象copy赋值给一个NSString不可变对象。
 
 对一个不可变对象，进行copy操作，是指针复制。结果是持有的是一个不可变对象。
 
 打印结果如下：
 
 2018-11-03 09:06:13.266724+0800 MemoryManagementDemo[6214:276340] 0x10389f0f8:immutableStr
 2018-11-03 09:06:13.266915+0800 MemoryManagementDemo[6214:276340] 0x10389f0f8:stringCopy
 */
- (void)yyi_copyImmutableObjToImmutableObj{
    NSString *immutableStr  = @"aaaa";
    self.stringCopy = immutableStr;
    NSLog(@"%p:immutableStr",immutableStr);
    NSLog(@"%p:stringCopy",self.stringCopy);
}

/**
 copy 不可变到可变
 
 场景2：将一个不可变NSString对象copy赋值给一个NSMutableString不可变对象。
 
 对一个不可变对象，进行copy操作，是指针复制。结果是持有的是一个不可变对象。
 
 immutableStr    __NSCFConstantString *    @"aaaa"    0x0000000103ac40f8
 
 打印结果如下：地址一样
 
 2018-11-02 18:27:13.900339+0800 MemoryManagementDemo[70268:3276758] mutableStringCopy:0x1064630f8
 2018-11-02 18:27:13.900593+0800 MemoryManagementDemo[70268:3276758] immutableStr:0x1064630f8
 */
- (void)yyi_copyImmutableObjToMutableObj{
    NSString *immutableStr  = @"aaaa";
    self.mutableStringCopy = immutableStr;
    NSLog(@"mutableStringCopy%p",self.mutableStringCopy);
    NSLog(@"immutableStr:%p",immutableStr);
    
    //因为持有的是一个__NSCFConstantString 不可变对象，所以appendString 会crash。2018-11-02 18:49:46.360700+0800 MemoryManagementDemo[70880:3310958] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'Attempt to mutate immutable object with appendString:'
//    [self.mutableStringCopy appendString:@"1212"];
}

/**
 copy 可变到不可变
 
 场景3：将一个可变NSMutableString对象copy赋值给一个NSString不可变对象。
 
 对一个可变对象，进行copy操作，是内容复制，深拷贝。结果是持有的是一个不可变对象。
 
 打印结果如下：地址不一样
 
 2018-11-02 18:43:52.577724+0800 MemoryManagementDemo[70657:3301525] stringCopy:0xcfed323b6bb5977e
 2018-11-02 18:43:52.577865+0800 MemoryManagementDemo[70657:3301525] mutableStr:0x600000470540
 */
- (void)yyi_copyMutableObjToImmutableObj{
    NSMutableString *mutableStr  = [[NSMutableString alloc] initWithString:@"aaaa"];
    self.stringCopy = mutableStr;
    NSLog(@"stringCopy:%p",self.stringCopy);
    NSLog(@"mutableStr:%p",mutableStr);
}


/**
 copy 可变到可变
 
 场景3：将一个可变NSMutableString对象copy赋值给一个NSString不可变对象。
 
 对一个可变对象，进行copy操作，是内容复制，深拷贝。结果是持有的是一个不可变对象。
 
 打印结果如下：地址不一样
 
 2018-11-02 18:46:19.908326+0800 MemoryManagementDemo[70761:3305983] mutableStringCopy:0xe23aabb47f472a15
 2018-11-02 18:46:19.908458+0800 MemoryManagementDemo[70761:3305983] mutableStr:0x60000255c150
 */
- (void)yyi_copyMutableObjToMutableObj{
    NSMutableString *mutableStr  = [[NSMutableString alloc] initWithString:@"aaaa"];
    self.mutableStringCopy = mutableStr;
    NSLog(@"mutableStringCopy:%p",self.mutableStringCopy);
    NSLog(@"mutableStr:%p",mutableStr);
    
    //2018-11-02 18:48:41.543638+0800 MemoryManagementDemo[70839:3308608] -[NSTaggedPointerString appendString:]: unrecognized selector sent to instance 0xacf20613d3c90b6d
//    [self.mutableStringCopy appendString:@"1212"];
}


#pragma mark - 对集合类对象的copy操作。


/**
 
 对集合类对象的操作和非集合类对象的copy和mutableCopy非常像。
 
 在集合类对象中，对immutable对象进行copy，是指针复制，mutableCopy是内容复制；对mutable对象进行copy和mutableCopy都是内容复制。但是：集合对象的内容复制仅限于对象本身，对象元素仍然是指针复制。用代码简单表示如下：
 
 [immutableObject copy] // 浅复制
 [immutableObject mutableCopy] //单层深复制
 [mutableObject copy] //单层深复制
 [mutableObject mutableCopy] //单层深复制
 
 
 打印结果如下：
 
 2018-11-03 19:04:16.282837+0800 MemoryManagementDemo[8487:518533] 0x6000020d86c0:immutableArray
 2018-11-03 19:04:16.283007+0800 MemoryManagementDemo[8487:518533] 0x6000020d86c0:copyImmutableArray
 2018-11-03 19:04:16.283102+0800 MemoryManagementDemo[8487:518533] 0x600002edb750:mutableCopyImmutableArray
 2018-11-03 19:04:16.283197+0800 MemoryManagementDemo[8487:518533] 0x600002edb0f0:mutableArray
 2018-11-03 19:04:16.283281+0800 MemoryManagementDemo[8487:518533] 0x600002edb630:copyMutableArray
 2018-11-03 19:04:16.283361+0800 MemoryManagementDemo[8487:518533] 0x600002edb180:mutableCopyMutableArray
 */
- (void)yyi_yyi_copyAndMutableCopyCollection{
    NSArray *immutableArray = @[@[@"a", @"b"], @[@"c", @"d"]];
    NSArray *copyImmutableArray = [immutableArray copy];
    NSMutableArray *mutableCopyImmutableArray = [immutableArray mutableCopy];

    //immutableArray    __NSArrayI *    @"2 elements"    0x00006000020c53a0
    NSLog(@"%p:immutableArray",immutableArray);
    //copyImmutableArray    __NSArrayI *    @"2 elements"    0x00006000020c53a0
    NSLog(@"%p:copyImmutableArray",copyImmutableArray);
    //mutableCopyImmutableArray    __NSArrayM *    @"2 elements"    0x0000600002ed0ed0
    NSLog(@"%p:mutableCopyImmutableArray",mutableCopyImmutableArray);
                       
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"a"],@"b",@"c",nil];
    NSArray *copyMutableArray = [mutableArray copy];
    NSMutableArray *mutableCopyMutableArray = [mutableArray mutableCopy];
    
    //mutableArray    __NSArrayM *    @"3 elements"    0x0000600002ed1890
    NSLog(@"%p:mutableArray",mutableArray);
    //copyMutableArray    __NSArrayI *    @"3 elements"    0x0000600002ed0b70
    NSLog(@"%p:copyMutableArray",copyMutableArray);
    //mutableCopyMutableArray    __NSArrayM *    @"3 elements"    0x0000600002ed1110
    NSLog(@"%p:mutableCopyMutableArray",mutableCopyMutableArray);
}


//集合的深复制
- (void)yyi_yyi_deepCopyAndMutableCopyCollection{
    
    // copyItems
    NSArray *immutableArray = @[@[@"a", @"b"], @[@"c", @"d"]];
    NSArray *deepCopyImmutableArray = [[NSArray alloc] initWithArray:immutableArray copyItems:YES];
    NSMutableArray *deepMutableCopyImmutableArray = [[NSMutableArray alloc] initWithArray:immutableArray copyItems:YES];

    //immutableArray    __NSArrayI *    @"2 elements"    0x00006000020c53a0
    NSLog(@"%p:immutableArray",immutableArray);
    //copyImmutableArray    __NSArrayI *    @"2 elements"    0x00006000020c53a0
    NSLog(@"%p:deepCopyImmutableArray",deepCopyImmutableArray);
    //mutableCopyImmutableArray    __NSArrayM *    @"2 elements"    0x0000600002ed0ed0
    NSLog(@"%p:mutableCopyImmutableArray",deepMutableCopyImmutableArray);

    
    //[[NSDictionary alloc] initWithDictionary:<#(nonnull NSDictionary *)#> copyItems:<#(BOOL)#>];
    //[[NSSet alloc] initWithSet:<#(nonnull NSSet *)#> copyItems:<#(BOOL)#>]
    
    //归档和解档
    NSArray *trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:immutableArray]];
    NSLog(@"%p:trueDeepCopyArray",trueDeepCopyArray);
    
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

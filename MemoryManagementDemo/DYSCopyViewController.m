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


@property (nonatomic ,copy) NSString *string_copy;
@property (nonatomic ,copy) NSMutableString *mutString_copy;

@end

@implementation DYSCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
        
    /**
     因为父类指针可以指向子类对象,使用 copy 的目的是为了让本对象的属性不受外界影响,使用 copy 无论给我传入是一个可变对象还是不可对象,我本身持有的就是一个不可变的副本.
     在非集合类对象中：对 immutable 对象进行 copy 操作，是指针复制，mutableCopy 操作时内容复制；对 mutable 对象进行 copy 和 mutableCopy 都是内容复制。
     
     //总结一句，是要是copy修饰符，最后都是持有不可变对象的指针。
     */
    //对非集合类对象的copy操作
//    [self yyi_copyImmutableObjToImmutableObj];
    [self yyi_copyImmutableObjToMutableObj];
//    [self yyi_copyMutableObjToImmutableObj];
//    [self yyi_copyMutableObjToMutableObj];
    
}

#pragma mark - 对非集合类对象的copy操作
//总结一句，是要是copy修饰符，最后都是持有不可变对象的指针。

/**
 copy  不可变到不可变
 
 
 场景1：将一个不可变NSString对象copy赋值给一个NSString不可变对象。
 
 对一个不可变对象，进行copy操作，是指针复制。结果是持有的是一个不可变对象。
 
 打印结果如下：
 
 2018-11-02 18:24:01.054351+0800 MemoryManagementDemo[69854:3264593] string_copy:0x10185f0f8
 2018-11-02 18:24:01.054538+0800 MemoryManagementDemo[69854:3264593] immutableStr:0x10185f0f8
 
 */
- (void)yyi_copyImmutableObjToImmutableObj{
    NSString *immutableStr  = @"aaaa";
    self.string_copy = immutableStr;
    NSLog(@"string_copy:%p",self.string_copy);
    NSLog(@"immutableStr:%p",immutableStr);
}

/**
 copy 不可变到可变
 
 场景2：将一个不可变NSString对象copy赋值给一个NSMutableString不可变对象。
 
 对一个不可变对象，进行copy操作，是指针复制。结果是持有的是一个不可变对象。
 
 immutableStr    __NSCFConstantString *    @"aaaa"    0x0000000103ac40f8
 
 打印结果如下：地址一样
 
 2018-11-02 18:27:13.900339+0800 MemoryManagementDemo[70268:3276758] mutString_copy:0x1064630f8
 2018-11-02 18:27:13.900593+0800 MemoryManagementDemo[70268:3276758] immutableStr:0x1064630f8
 */
- (void)yyi_copyImmutableObjToMutableObj{
    NSString *immutableStr  = @"aaaa";
    self.mutString_copy = immutableStr;
    NSLog(@"mutString_copy%p",self.mutString_copy);
    NSLog(@"immutableStr:%p",immutableStr);
    
    //因为持有的是一个__NSCFConstantString 不可变对象，所以appendString 会crash。2018-11-02 18:49:46.360700+0800 MemoryManagementDemo[70880:3310958] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'Attempt to mutate immutable object with appendString:'
//    [self.mutString_copy appendString:@"1212"];
}

/**
 copy 可变到不可变
 
 场景3：将一个可变NSMutableString对象copy赋值给一个NSString不可变对象。
 
 对一个可变对象，进行copy操作，是内容复制，深拷贝。结果是持有的是一个不可变对象。
 
 打印结果如下：地址不一样
 
 2018-11-02 18:43:52.577724+0800 MemoryManagementDemo[70657:3301525] string_copy:0xcfed323b6bb5977e
 2018-11-02 18:43:52.577865+0800 MemoryManagementDemo[70657:3301525] mutableStr:0x600000470540
 */
- (void)yyi_copyMutableObjToImmutableObj{
    NSMutableString *mutableStr  = [[NSMutableString alloc] initWithString:@"aaaa"];
    self.string_copy = mutableStr;
    NSLog(@"string_copy:%p",self.string_copy);
    NSLog(@"mutableStr:%p",mutableStr);
}


/**
 copy 可变到可变
 
 场景3：将一个可变NSMutableString对象copy赋值给一个NSString不可变对象。
 
 对一个可变对象，进行copy操作，是内容复制，深拷贝。结果是持有的是一个不可变对象。
 
 打印结果如下：地址不一样
 
 2018-11-02 18:46:19.908326+0800 MemoryManagementDemo[70761:3305983] mutString_copy:0xe23aabb47f472a15
 2018-11-02 18:46:19.908458+0800 MemoryManagementDemo[70761:3305983] mutableStr:0x60000255c150
 */
- (void)yyi_copyMutableObjToMutableObj{
    NSMutableString *mutableStr  = [[NSMutableString alloc] initWithString:@"aaaa"];
    self.mutString_copy = mutableStr;
    NSLog(@"mutString_copy:%p",self.mutString_copy);
    NSLog(@"mutableStr:%p",mutableStr);
    
    //2018-11-02 18:48:41.543638+0800 MemoryManagementDemo[70839:3308608] -[NSTaggedPointerString appendString:]: unrecognized selector sent to instance 0xacf20613d3c90b6d
//    [self.mutString_copy appendString:@"1212"];
}


#pragma mark - 对集合类对象的copy操作。


- (void)yyi_testBtn{
    
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

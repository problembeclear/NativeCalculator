//
//  CalculatorModel.h
//  NativeCalculator
//
//  Created by 张思扬 on 2022/9/28.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorModel : NSObject

@property (nonatomic , strong) NSMutableString* expression;

@property (nonatomic , strong) NSMutableArray* numArray;
@property (nonatomic , strong) NSMutableArray* strArray;

@property (assign) NSInteger numCount;

@property (assign) NSInteger charCount;
//入数字栈
- (void) pushNum: (double) num;
//入符号栈
- (void) pushChar: (char) c;
//出数字栈
- (double) popNum;
//出符号栈
- (char) popChar;
//取栈顶数字
- (double) topNum;
//取栈顶符号
- (char) topChar;
//将栈中字符串转为数字
- (double) transNum: (NSString*) string;

//比较符号优先级
- (NSInteger) compare:(char) str;

//置空数字栈
- (NSInteger) emptyNum;
//置空符号栈
- (NSInteger) emptyChar;


//计算函数
- (double) counter:(double) first :(double) second :(char) counterStr ;
@end

NS_ASSUME_NONNULL_END

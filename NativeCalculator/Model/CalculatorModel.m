//
//  CalculatorModel.m
//  NativeCalculator
//
//  Created by 张思扬 on 2022/9/28.
//

#import "CalculatorModel.h"


@implementation CalculatorModel

- (void) pushNum:(double)num {
    if (_numArray.count == 50) {
            NSLog(@"进栈失败");
            return;
        }
    //NSLog(@"%f", num);
    [_numArray addObject:[NSString stringWithFormat:@"%f", num]];
    return;
}

- (void) pushChar: (char) c {
    if (_strArray.count == 50) {
            NSLog(@"进栈失败");
            return;
        }
    //NSLog(@"%c", c);
    [_strArray addObject:[NSString stringWithFormat:@"%c", c]];
    
    _charCount++;
    return;
}


//字符串转数字
- (double) transNum: (NSString*) string {
    
    //NSLog(@"%c", [string characterAtIndex:0]);
    
    int minus = 0;
    
    double result;
    
    if ([string characterAtIndex:0] == '-') {
        minus = 1;
    }
    
    if (minus == 0) {
        int i = 0;
        double x = 0;
        
        while ([string characterAtIndex:i] >= '0' &&
               [string characterAtIndex:i] <= '9' &&
               i < string.length) {
            x *= 10 ;
            x += (double) [string characterAtIndex:i] - '0';
            //NSLog(@"%f", x);
            ++i;
        }
        
        //存在小数点
        if (i < string.length && [string characterAtIndex:i] == '.') {
            double m = 0.1;
            i++;
            while (i < string.length) {
                x += ((double) [string characterAtIndex:i] - '0') * m;
                m *= 0.1;
                ++i;
            }
        }
        result = x;
    } else {                //
        int i = 1;
        double x = 0;
        while ([string characterAtIndex:i] >= '0' &&
               [string characterAtIndex:i] <= '9' &&
               i < string.length) {
            x *= 10;
            x += (double)[string characterAtIndex:i] - '0';
            ++i;
        }
        //存在小数点
        if (i < string.length && [string characterAtIndex:i] == '.') {
            double m = 0.1;
            ++i;
            while (i < string.length) {
                x += ((double)[string characterAtIndex:i] - '0') * m;
                m *= 0.1;
                ++i;
            }
        }
        result = x;
    }
    
    if (minus == 0) {
        return  result;
    } else {
        return  -result;
    }
    
}





- (double) popNum {
        
    double temp = [self transNum:_numArray[_numArray.count - 1]];
    
    
    [_numArray removeLastObject];
    
    return temp;
}

- (char) popChar {
    char temp = [_strArray[_strArray.count - 1] characterAtIndex:0];
    
    [_strArray removeLastObject];
    
    return temp;
}


//返回数字栈栈顶
- (double) topNum {
    return [self transNum:_numArray[_numArray.count - 1]];
}

//返回符号栈栈顶
- (char) topChar {
    return [_strArray[_strArray.count - 1] characterAtIndex:0];
}




//比较符号优先级
- (NSInteger) compare:(char) str {
    if (str == '+' || str == '-') {
        return 1;
    } else if (str == '*' || str == '/') {
        return 2;
    } else {
        return 0;
    }
}

//计算函数
- (double) counter:(double) first :(double) second :(char) counterStr {
    double ans = 0.0;
    if (counterStr == '+') {
        ans = first + second;
    } else if (counterStr == '-') {
        ans = second - first;
    } else if (counterStr == '*') {
        ans = first * second;
    } else {
        ans = second / first;
    }
    
    return ans;
}

- (NSInteger) emptyNum{
    
    NSInteger cnt = _numArray.count;
    [_numArray removeAllObjects];
    return cnt;
}

- (NSInteger) emptyChar {
    NSInteger cnt = _strArray.count;
    [_strArray removeAllObjects];
    return cnt;
}

@end

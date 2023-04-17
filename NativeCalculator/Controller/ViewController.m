//
//  ViewController.m
//  NativeCalculator
//
//  Created by 张思扬 on 2022/9/28.
//

#import "ViewController.h"
#import "CalculatorView.h"
#import "CalculatorModel.h"

#import <stdio.h>
#import <stdlib.h>

#import "Masonry.h"


#define maxSize 100
@interface ViewController () 

@property (nonatomic, strong) CalculatorView* mainView;
@property (assign) NSInteger charCount;
@property (assign) NSInteger pointCount;

@property (assign) NSInteger againSign;
@property (assign) NSInteger rightBracket;
@property (assign) NSInteger leftBracket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    _charCount = 0;
    _errorSign = 1;
    _bracketSign = 0;
    _pointSign = 0;
    _countSign = 0;
    _ACSign = 1;
    _pointCount = 0;
    _againSign = 0;
    
    _leftBracket = 1;
    _rightBracket = 0;
    
    _mainView = [CalculatorView new];
    
    _mainView.frame = CGRectMake(0, 0, self.view.bounds.size.width , self.view.bounds.size.height);
    
    [self.view addSubview:_mainView];
        
    [_mainView InitView];
        
    _mainView.delegate = self;
   
    
    
}

- (void) send:(UIButton *)button {
    //包含所有数字以及小数点
    if ( button.tag >= 100 && button.tag <= 110) {
        
        NSString* existingString = [NSString new];
        existingString = _mainView.numLabel.text;
        
        NSMutableString* newString = [NSMutableString stringWithString:existingString];
        
        if (button.tag != 110) {
            
            if (_countSign == 0 && _rightBracket == 0) {
                [newString appendFormat:@"%ld", button.tag - 100];
                _pointSign = 1;
                
                _errorSign = 0;
            }
        } else {
            if (_pointSign != 0 && _rightBracket == 0) {
                [newString appendString:@"."];
                _pointSign = 0;
                _errorSign = 1;
                _pointCount++;
            }
        }
       
        _leftBracket = 0;
        
        
        _mainView.numLabel.text = [NSString stringWithString:newString];
        
        [_mainView.numLabel reloadInputViews];
        
        //NSLog(@"%ld", _errorSign);
    }
    //括号
    if (button.tag == 112 || button.tag == 113) {
        NSString* existingString = [NSString new];
        existingString = _mainView.numLabel.text;
        
        NSMutableString* newString = [NSMutableString stringWithString:existingString];
        
        if (button.tag == 112) {
            if (_leftBracket == 1) {
                [newString appendString:@"("];
                _bracketSign += 1;
            }
            
        } else {
            
            NSString* testNewString = [newString substringFromIndex:newString.length - 1];
            
            if (_bracketSign != 0 && ![testNewString isEqualToString:@"("] ) {
                [newString appendString:@")"];
                _bracketSign -= 1;
                _rightBracket = 1;
            }
            
        }
       
        _mainView.numLabel.text = [NSString stringWithString:newString];
        
        [_mainView.numLabel reloadInputViews];
    }
    //包含四个运算符号
    if ( button.tag >= 114 && button.tag <= 117) {
        //NSLog(@"%ld", _errorSign);
        if (_errorSign == 0) {
            NSString* existingString = [NSString new];
            existingString = _mainView.numLabel.text;
            
            NSMutableString* newString = [NSMutableString stringWithString:existingString];
            
            
            
            if (button.tag == 114) {
                [newString appendString:@"/"];
            } else if (button.tag == 115) {
                [newString appendString:@"*"];
            } else if (button.tag == 116) {
                [newString appendString:@"-"];
            } else if (button.tag == 117) {
                [newString appendString:@"+"];
            }
           
            _errorSign = 1;
            
            //_countSign = 1;
            
            _charCount ++;
            
            _pointSign = 1;
            
            _leftBracket = 1;
            _rightBracket = 0;
            
            _mainView.numLabel.text = [NSString stringWithString:newString];
            
            [_mainView.numLabel reloadInputViews];
        } else {
            
        }
        
        
    }

    //AC
    if (button.tag == 111) {
        self.mainView.numLabel.text = @"";
        
        
        _charCount = 0;
        _errorSign = 1;
        _bracketSign = 0;
        _pointSign = 0;
        _countSign = 0;
        _ACSign = 1;
        _pointCount = 0;
        _againSign = 0;
        
        _leftBracket = 1;
        _rightBracket = 0;
        
        [_mainView.numLabel reloadInputViews];
    }
    
    //等号
    if (button.tag == 118) {
        _againSign = 1;
//        NSLog(@"%ld,%ld,%ld",_errorSign,_bracketSign,_ACSign);
        if (_charCount == 0) {
            
            
            
            if (_pointCount == 1 || _pointCount == 0) {
                
                if (_rightBracket == 1) {
                    
                    
                    _mainView.numLabel.text = [_mainView.numLabel.text stringByReplacingOccurrencesOfString:@"(" withString:@""];
                    _mainView.numLabel.text = [_mainView.numLabel.text stringByReplacingOccurrencesOfString:@")" withString:@""];

                    
                }
                    _mainView.numLabel.text = [NSMutableString stringWithFormat:@"%@", @(_mainView.numLabel.text.floatValue)];
                    
                    [_mainView.numLabel reloadInputViews];
                
                
                
                return;
            } else {
                _mainView.numLabel.text = @"ERROR";
                
                [_mainView.numLabel reloadInputViews];
            }
            
            /*

            if (_pointCount >= 2) {
                _mainView.numLabel.text = @"ERROR";
                
                [_mainView.numLabel reloadInputViews];
            } else if (_bracketSign == 0) {
               NSString* stringFromArray = [_mainView.numLabel.text stringByReplacingOccurrencesOfString:@"(" withString:@""];
                
                NSString* deleteBracketString = [stringFromArray stringByReplacingOccurrencesOfString:@")" withString:@""];
                
                _mainView.numLabel.text = deleteBracketString;
                    
                [_mainView.numLabel reloadInputViews];
            } else {
                _mainView.numLabel.text = @"ERROR";
                
                [_mainView.numLabel reloadInputViews];
            }
             */

            
            
        } else if (_errorSign == 0 && _bracketSign == 0 ) {
            
                            
                
            //计算并把最终结果显示到屏幕
            [self calculation];
                
                
                
           
            
        } else {
            _mainView.numLabel.text = @"ERROR";
            
            [_mainView.numLabel reloadInputViews];
        }
    }
    
    
    
}

- (void) calculation {
    CalculatorModel* Model = [[CalculatorModel alloc]init];
    
    Model.numArray = [[NSMutableArray alloc]init];
    Model.strArray = [[NSMutableArray alloc]init];
    Model.expression = [NSMutableString stringWithString:_mainView.numLabel.text];
    
    Model.charCount = 0;
    
    NSMutableString* newString = [NSMutableString stringWithString:Model.expression];
        
    [newString appendString:@"#"];
    
    
    char* cStr = (char*)[newString UTF8String];
    
 
    
/*          NSMutableArray* arrayStack = [[NSMutableArray alloc]init];
                
    for (int i = 0; i < Model.expression.length; i++) {
        if (cStr[i] == '+' || cStr[i] == '-') {
            if ([arrayStack.lastObject isEqualToString:@"*"] ||
                [arrayStack.lastObject isEqualToString:@"/"]) {
                
            }
        } else if (cStr[i] == '*' || cStr[i] == '/') {
            
        } else if (cStr[i] == ')') {
            
        } else {
            
        }
    }
    */
    
   
    
    int index = 0;
    
    double x = 0;
    
    double numberFirst, numberSecond;
    
    char testChar;
    
    double lastResult = 0.0;
    
    while (cStr[index] != '#') {
        
        
        
        x = 0;
        //判断是数字入数字栈
        if (cStr[index] >= '0' && cStr[index] <= '9') {
            while (cStr[index] >= '0' && cStr[index] <= '9') {
                x = x * 10;
                
                x = x + cStr[index] - '0';
                
               
                index++;
            }
            //判断小数点
            if (cStr[index] == '.') {
                double t = 0.1;
                index++;
                while (cStr[index] >= '0' && cStr[index] <= '9') {
                    x += (t * (cStr[index] - '0'));
                    t *= 0.1;
                    index++;
                }
            }
            //将得到的数字送进数字栈
            [Model pushNum:x];
            
            continue;
        }
        //判断是符号送进符号栈,送符号进栈时确保符号栈空
        if (Model.strArray.count == 0 && (cStr[index] == '+' || cStr[index] == '-' || cStr[index] == '*' || cStr[index] == '/' || cStr[index] == '(' || cStr[index] == ')')) {
                            
                if (cStr[index] == '-') {
                    if (index == 0) {
                        x = 0;
                                            
                        index++;
                        //判断是数字入数字栈
                        if (cStr[index] >= '0' && cStr[index] <= '9') {
                            while (cStr[index] >= '0' && cStr[index] <= '9') {
                            x = x * 10;
                                                    
                            x = x + cStr[index] - '0';
                                                    
                                                   
                            index++;
                            }
                            //判断小数点
                            if (cStr[index] == '.') {
                                double t = 0.1;
                                index++;
                                while (cStr[index] >= '0' && cStr[index] <= '9') {
                                    x += (t * (cStr[index] - '0'));
                                    t *= 0.1;
                                    index++;
                                }
                            }
                                                
                            //加负号
                                                
                            x*=(-1);
                                                
                                                
                                                
                            //将得到的数字送进数字栈
                            [Model pushNum:x];
                                                
                            continue;
                        }
                    } else if (index != 0) {
                        if (cStr[index - 1] == '(' ) {
                            x = 0;
                                            
                            index++;
                            //判断是数字入数字栈
                            if (cStr[index] >= '0' && cStr[index] <= '9') {
                                while (cStr[index] >= '0' && cStr[index] <= '9') {
                                    x = x * 10;
                                                    
                                    x = x + cStr[index] - '0';
                                                    
                                                   
                                    index++;
                                }
                                //判断小数点
                                if (cStr[index] == '.') {
                                    double t = 0.1;
                                    index++;
                                    while (cStr[index] >= '0' && cStr[index] <= '9') {
                                        x += (t * (cStr[index] - '0'));
                                        t *= 0.1;
                                        index++;
                                    }
                                }
                                                
                                //加负号
                                                
                                x*=(-1);
                                                
                                                
                                //将得到的数字送进数字栈
                                [Model pushNum:x];
                                                
                                continue;
                                            
                                            
                            }
                        } else {
                            [Model pushChar:cStr[index]];
                            index++;
                            continue;
                        }
                    }
                } else {
                    [Model pushChar:cStr[index]];
                    index++;
                    continue;
                }
        }
                //左括号直接入栈
                if (cStr[index] == '(') {
                    [Model pushChar:cStr[index]];
                    index++;
                    continue;
                }
                //右括号需要循环取出符号栈的符号，同时循环每次取两个数字栈的数字运算后，放回数字栈，直到从符号栈取出左括号
                if (cStr[index] == ')') {
                    while ( [Model topChar] != '(') {
                        testChar = [Model popChar];
                        numberFirst = [Model popNum];
                                
                        numberSecond = [Model popNum];
                                
                        lastResult = [Model counter:numberFirst :numberSecond :testChar];
                                
                        //计算结果入数字栈
                        [Model pushNum:lastResult];
                    }
                    //左括号出栈
                    [Model popChar];
                    index++;
                    continue;
                }
                //入符号栈
                if ([Model compare:cStr[index]] <= [Model compare:[Model topChar]]) {
                    testChar = [Model popChar];
                            
                    numberFirst = [Model popNum];

                    numberSecond = [Model popNum];
                            
                    lastResult = [Model counter:numberFirst :numberSecond :testChar];
                            
                    [Model pushNum:lastResult];
                }
                [Model pushChar:cStr[index]];
                index++;
            }
                
               
                
                
                
            //若是符号栈还不为空
            while (Model.strArray.count > 0) {
                testChar = [Model popChar];
                    
                numberFirst = [Model popNum];
                numberSecond = [Model popNum];
                
                lastResult = [Model counter:numberFirst :numberSecond :testChar];
                    
                [Model pushNum:lastResult];
            }
    
                
                
                
            NSString* testString = [NSString stringWithFormat:@"%f", lastResult];
                
            float k = (float) lastResult;
             
                
            int n = (int) k;
                
             
                
                
                
                
                
            NSMutableString* lastString;
            if ((k - n) <= 0.001 && k >= n) {
                lastString = [NSMutableString stringWithFormat:@"%d", n];

            } else if((n-k) <= 0.001 && k < n) {
                lastString = [NSMutableString stringWithFormat:@"%d", n];

            } else {
                if (k>=n) {
                    lastString = [NSMutableString stringWithFormat:@"%@", @(testString.floatValue)];
                        
                        
                } else {
                    lastString = [NSMutableString stringWithFormat:@"%@", @(testString.floatValue)];
                }
                    
            }
                
                
            _mainView.numLabel.text = lastString;

            [_mainView.numLabel reloadInputViews];
                
            _ACSign = 0;
        }



 @end
    

    

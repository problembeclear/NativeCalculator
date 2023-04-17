//
//  ViewController.h
//  NativeCalculator
//
//  Created by 张思扬 on 2022/9/28.
//

#import <UIKit/UIKit.h>
#import "CalculatorView.h"

@interface ViewController : UIViewController <sendButton>


@property (assign, nonatomic) NSInteger errorSign;//运算符号
@property (assign, nonatomic) NSInteger bracketSign;//括号
@property (assign, nonatomic) NSInteger pointSign;//小数点
@property (assign, nonatomic) NSInteger countSign;//

@property (assign, nonatomic) NSInteger ACSign;//AC按钮

- (void) send:(UIButton *)button;

- (void) calculation;

@end


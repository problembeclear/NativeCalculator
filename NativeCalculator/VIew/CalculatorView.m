//
//  CalculatorView.m
//  NativeCalculator
//
//  Created by 张思扬 on 2022/9/28.
//

#import "CalculatorView.h"
#import "Masonry.h"
@implementation CalculatorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) InitView {
    self.backgroundColor = [UIColor blackColor];
    
//布局label
    
    _numLabel = [[UILabel alloc]init];
    
    _numLabel.frame = CGRectMake(30, self.frame.size.height*0.3, self.frame.size.width - 60, self.frame.size.height*0.1);
    
    [self addSubview:_numLabel];
    
    _numLabel.text = @"";
    
    _numLabel.font = [UIFont systemFontOfSize:46];
    
    _numLabel.textColor = [UIColor whiteColor];
    
    _numLabel.textAlignment = NSTextAlignmentRight;
    
    
    
    
    
//布局按钮
    
    for (int i = 1; i <= 4; i++) {
        for (int j = 1; j <=4; j++) {
            
            _roundButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            [_roundButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:_roundButton];
            //设置按钮圆角
            _roundButton.layer.cornerRadius = 45;
            //边框宽度
            _roundButton.layer.borderWidth = 1;
            
            [_roundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            _roundButton.titleLabel.font = [UIFont systemFontOfSize:45];
            
            [_roundButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(self.frame.size.height/3 + 100 * (i-1) + 80));
                make.left.equalTo(@(10 + (j-1) * 100));
                make.height.equalTo(@90);
                make.width.equalTo(@90);
                
            }];
            if (i == 1 && j != 4) {
                _roundButton.backgroundColor = [UIColor colorWithRed:0.608 green:0.608 blue:0.608 alpha:1];
                [_roundButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

                if (j == 1) {
                    [_roundButton setTitle:@"AC" forState:UIControlStateNormal];
                    _roundButton.titleLabel.textColor = [UIColor blackColor];
                }
                if (j == 2) {
                    [_roundButton setTitle:@"(" forState:UIControlStateNormal];
                    _roundButton.titleLabel.textColor = [UIColor blackColor];

                }
                if (j == 3) {
                    [_roundButton setTitle:@")" forState:UIControlStateNormal];
                    _roundButton.titleLabel.textColor = [UIColor blackColor];

                }
                _roundButton.tag = 110 + j;
            }
            if (i == 2 && j != 4) {
                _roundButton.backgroundColor = [UIColor darkGrayColor];
                if (j == 1) {
                    [_roundButton setTitle:@"7" forState:UIControlStateNormal];
                }
                if (j == 2) {
                    [_roundButton setTitle:@"8" forState:UIControlStateNormal];
                }
                if (j == 3) {
                    [_roundButton setTitle:@"9" forState:UIControlStateNormal];
                }
                
                _roundButton.tag = 106 + j;
            }
            if (i == 3 && j != 4) {
                _roundButton.backgroundColor = [UIColor darkGrayColor];

                if (j == 1) {
                    [_roundButton setTitle:@"4" forState:UIControlStateNormal];
                }
                if (j == 2) {
                    [_roundButton setTitle:@"5" forState:UIControlStateNormal];
                }
                if (j == 3) {
                    [_roundButton setTitle:@"6" forState:UIControlStateNormal];
                }
                _roundButton.tag = 103 + j;
            }
            if (i == 4 && j != 4) {
                _roundButton.backgroundColor = [UIColor darkGrayColor];

                if (j == 1) {
                    [_roundButton setTitle:@"1" forState:UIControlStateNormal];
                }
                if (j == 2) {
                    [_roundButton setTitle:@"2" forState:UIControlStateNormal];
                }
                if (j == 3) {
                    [_roundButton setTitle:@"3" forState:UIControlStateNormal];
                }
                
                _roundButton.tag = 100 + j;
            }
            
            
            
            if (j == 4) {
                _roundButton.backgroundColor = [UIColor orangeColor];
                if (i == 1) {
                    [_roundButton setTitle:@"÷" forState:UIControlStateNormal];
                    _roundButton.tag = 114;
                } else if (i == 2) {
                    [_roundButton setTitle:@"×" forState:UIControlStateNormal];
                    _roundButton.tag = 115;
                } else if (i == 3) {
                    [_roundButton setTitle:@"－" forState:UIControlStateNormal];
                    _roundButton.tag = 116;
                } else {
                    [_roundButton setTitle:@"+" forState:UIControlStateNormal];
                    _roundButton.tag = 117;
                }
            }
            
            
            
            
            
            
            
        }
    }
    //最后一行   一个零 一个点 一个等号
    for (int k = 0; k < 3; k++) {
        if (k == 0) {
            _roundButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            [_roundButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:_roundButton];
            //设置按钮圆角
            _roundButton.layer.cornerRadius = 45;
            //边框宽度
            _roundButton.layer.borderWidth = 1;
            
            [_roundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            _roundButton.titleLabel.font = [UIFont systemFontOfSize:45];
            
            [_roundButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(self.frame.size.height/3 + 100 * 4 + 80));
                make.left.equalTo(@(10 + 0 * 100));
                make.height.equalTo(@90);
                make.width.equalTo(@190);
                
            }];
            
            [_roundButton setTitle:@"0" forState:UIControlStateNormal];
            
            _roundButton.backgroundColor = [UIColor darkGrayColor];
            
            _roundButton.tag = 100;
            
        } else {
            _roundButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            [_roundButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:_roundButton];
            //设置按钮圆角
            _roundButton.layer.cornerRadius = 45;
            //边框宽度
            _roundButton.layer.borderWidth = 1;
            
            [_roundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            _roundButton.titleLabel.font = [UIFont systemFontOfSize:45];
            
            [_roundButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(self.frame.size.height/3 + 100 * 4 + 80));
                make.left.equalTo(@(10 + (k+1) * 100));
                make.height.equalTo(@90);
                make.width.equalTo(@90);
                
            }];
            
            
            if (k == 1) {
                [_roundButton setTitle:@"." forState:UIControlStateNormal];
                _roundButton.backgroundColor = [UIColor darkGrayColor];
                
                _roundButton.tag = 110;
            }
            if (k == 2) {
                [_roundButton setTitle:@"=" forState:UIControlStateNormal];
                _roundButton.backgroundColor = [UIColor orangeColor];
                
                _roundButton.tag = 118;
            }
        }
    }
    
   
}


- (void) pressButton: (UIButton*) button {
    
    [_delegate send:button];
}



@end

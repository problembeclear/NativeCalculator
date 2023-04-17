//
//  CalculatorView.h
//  NativeCalculator
//
//  Created by 张思扬 on 2022/9/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol sendButton <NSObject>

- (void) send: (UIButton*) button;

@end



@interface CalculatorView : UIView

//@property (nonatomic, strong) UITextField* numTextField;
@property (nonatomic, strong) UIButton* roundButton;
@property (nonatomic, strong) UILabel* numLabel;

@property (nonatomic, assign) id<sendButton> delegate;

- (void) InitView;

@end

NS_ASSUME_NONNULL_END

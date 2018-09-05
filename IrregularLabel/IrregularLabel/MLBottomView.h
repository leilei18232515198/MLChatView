//
//  MLBottomView.h
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/4.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InputDelegate <NSObject>
//输入弹框调用的方法
- (void)InputBounced:(CGFloat)height time:(CGFloat)time;
//隐藏弹框调用的方法
- (void)hidenBounced:(CGFloat)height time:(CGFloat)time;
@end
@interface MLBottomView : UIView<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *textView;
@property (nonatomic,weak)id<InputDelegate>delegate;

@end

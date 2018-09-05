//
//  MLBottomView.m
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/4.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLBottomView.h"

@implementation MLBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self listeningKeyboard];
        [self configureView];
    }
    
    return self;
}

//监听垫盘调用的通知
- (void)listeningKeyboard {
    //键盘将要显示时候的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(boardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //键盘将要结束时候的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(boardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}

//布局页面
- (void)configureView {
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(BLControlEdge, (49-2*BLControlGap)/2, 3*BLControlGap, 2*BLControlGap)];
    imageView.backgroundColor = [UIColor magentaColor];
    [self addSubview:imageView];
    
    self.textView = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+BLControlEdge, 0, kScreen_width-CGRectGetMaxX(imageView.frame)-BLControlEdge, 49)];
    self.textView.delegate = self;
    self.textView.placeholder = @"请输入消息...";
    self.textView.returnKeyType = UIReturnKeyDone;
    [self addSubview:self.textView];
}

//键盘将要显示
-(void)boardWillShow:(NSNotification *)notification{
    
    //获取键盘高度，
    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    //键盘弹出的时间
    CGFloat time = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    if (self.delegate&&[self.delegate respondsToSelector:@selector(InputBounced: time:)]){
        [self.delegate InputBounced:kbHeight time:time];
    }
    
}

//键盘将要结束
-(void)boardDidHide:(NSNotification *)notification{
    
    //获取键盘高度，
    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    //键盘弹出的时间
    CGFloat time = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    if (self.delegate&&[self.delegate respondsToSelector:@selector(hidenBounced: time:)]) {
        [self.delegate hidenBounced:kbHeight time:time];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end

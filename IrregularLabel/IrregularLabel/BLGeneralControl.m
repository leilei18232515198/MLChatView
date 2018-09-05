//
//  BLGeneralControl.m
//  268EDU_Demo
//
//  Created by Balopy on 2017/7/31.
//  Copyright © 2017年 edu268. All rights reserved.
//

#import "BLGeneralControl.h"

@implementation BLGeneralControl

+ (UILabel *) createUILabelWithColor:(UIColor *)color Font:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment fromView:(id)view  {
   
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.textAlignment = textAlignment;
    label.font = FONT(font);
    [view addSubview:label];
    
    return label;
}


//+ (YYLabel *) createYYLabelWithColor:(UIColor *)color Font:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment fromView:(id)view {
//    
//    YYLabel *label = [[YYLabel alloc] init];
//    label.textColor = color;
//    label.textAlignment = textAlignment;
//    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
//    label.font = FONT(font);
//    [view addSubview:label];
//    
//    return label;
//}



+ (UIView *) createUIViewWithBackColor:(UIColor *)color fromVeiew:(id)view {
   
    UIView *lineView= [[UIView alloc] init];
    lineView.backgroundColor = color;
    [view addSubview:lineView];
    return lineView;
}

+ (UIButton *) createUIButtonWithBackColor:(UIColor *)color title:(NSString *)normalTitle titleColor:(UIColor *)textColor titleFont:(CGFloat)font normalIcon:(NSString *)normalIcon selectedIcon:(NSString *)selectedIcon fromVeiew:(id)view {
    
    UIButton *unlockBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [unlockBtn setBackgroundColor:color];
   
    [unlockBtn setTitle:normalTitle forState:UIControlStateNormal];
  
    [unlockBtn setTitleColor:textColor forState:UIControlStateNormal];
   
    unlockBtn.titleLabel.font = FONT(font);
    
    [unlockBtn setImage:[UIImage imageNamed:normalIcon] forState:UIControlStateNormal];
    
    [unlockBtn setImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateSelected];
    
    [view addSubview:unlockBtn];
    return unlockBtn;
    
}


@end

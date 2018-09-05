//
//  MLlabel.m
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/3.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLlabel.h"

@implementation MLlabel

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
    self.maskLayer = [CAShapeLayer layer];
    // 设置遮罩
    [self.layer setMask:self.maskLayer];
    // 初始化路径
    self.borderPath = [UIBezierPath bezierPath];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 遮罩层frame
    
     self.maskLayer.frame = self.bounds;
    // 设置path起点
    [self.borderPath moveToPoint:CGPointMake(0, 5)];

//    [self.borderPath moveToPoint:CGPointMake(0, 5)];
    
    
    [self.borderPath moveToPoint:CGPointMake(10, 10)];
    // 左上角的圆角
 [self.borderPath addQuadCurveToPoint:CGPointMake(20, 0) controlPoint:CGPointMake(10, 0)];
    
     // 直线，到右上角
 [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width - 10, 0)];

     // 右上角的圆角
 [self.borderPath addQuadCurveToPoint:CGPointMake(self.bounds.size.width, 10) controlPoint:CGPointMake(self.bounds.size.width, 0)];
      // 直线，到右下角
 [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height-10)];
    
//    直线到右下角圆角
 [self.borderPath addQuadCurveToPoint:CGPointMake(self.bounds.size.width-10, self.bounds.size.height) controlPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];

//    直线到左下角直角
 [self.borderPath addLineToPoint:CGPointMake(20, self.bounds.size.height)];

    //    直线到左下角圆角
 [self.borderPath addQuadCurveToPoint:CGPointMake(10, self.bounds.size.height-10) controlPoint:CGPointMake(10, self.bounds.size.height)];
    
//[self.borderPath addLineToPoint:CGPointMake(10, 30)];

        // 将这个path赋值给maskLayer的path
        self.maskLayer.path = self.borderPath.CGPath;

}
@end

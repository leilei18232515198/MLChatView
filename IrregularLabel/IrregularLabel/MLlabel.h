//
//  MLlabel.h
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/3.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLlabel : UILabel
/** 遮罩 */
@property (nonatomic, strong) CAShapeLayer *maskLayer;
/** 路径 */
@property (nonatomic, strong) UIBezierPath *borderPath;

@end

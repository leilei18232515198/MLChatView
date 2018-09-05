//
//  MLChatFrameModel.m
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/4.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLChatFrameModel.h"

@implementation MLChatFrameModel

- (void)setModel:(MLChatModel *)model {
    _model = model;
   // 首先计算文本宽度和高度
    CGRect rect = [self calculateTextSize:_model.title];
//    背景气泡的位置
    if (_model.isLeft) {
//    头像的位置
    self.imageFrame = CGRectMake(BLControlGap, BLControlGap, 3*BLControlGap, 3*BLControlGap);
//    背景气泡
    self.bubblesFrame = CGRectMake(CGRectGetMaxX(self.imageFrame)+5, BLControlGap, rect.size.width+2*BLControlEdge, rect.size.height+2*BLControlEdge);
    }else {
    self.imageFrame = CGRectMake(kScreen_width-4*BLControlGap, BLControlGap, 3*BLControlGap, 3*BLControlGap);
    self.bubblesFrame = CGRectMake( kScreen_width-4*BLControlGap-5-rect.size.width-2*BLControlEdge, BLControlGap, rect.size.width+2*BLControlEdge, rect.size.height+2*BLControlEdge);
    }
//    气泡上的文字
    self.titleFrame = CGRectMake(BLControlEdge, BLControlGap, rect.size.width, rect.size.height);
    self.height = CGRectGetMaxY(self.bubblesFrame)+2*BLControlGap;
    
}

- (CGRect)calculateTextSize:(NSString *)string {
    CGRect rec = [string boundingRectWithSize:CGSizeMake(kScreen_width-10*BLControlGap, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil];
    return rec;
}
@end

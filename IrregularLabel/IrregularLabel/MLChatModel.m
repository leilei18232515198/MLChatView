//
//  MLChatModel.m
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/4.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLChatModel.h"

@implementation MLChatModel

- (void)setIsLeft:(BOOL)isLeft {
    
    _isLeft = isLeft;
    if (_isLeft) {
//  左边聊天背景气泡
    self.picture = @"ReceiverAppNodeBkg";
    }else {
//  右边聊天背景气泡
    self.picture = @"SenderTextNodeBkg";
    }
}
@end

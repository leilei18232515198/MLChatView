//
//  MLChatFrameModel.h
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/4.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLChatModel.h"
#import <UIKit/UIKit.h>
@interface MLChatFrameModel : NSObject
@property (nonatomic,strong)MLChatModel *model;
@property (nonatomic,assign)CGRect imageFrame;
@property (nonatomic,assign)CGRect bubblesFrame;
@property (nonatomic,assign)CGRect titleFrame;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)NSInteger timeCount;
@end

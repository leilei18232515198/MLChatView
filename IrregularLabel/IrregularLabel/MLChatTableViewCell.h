//
//  MLChatTableViewCell.h
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/4.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLChatFrameModel.h"
@interface MLChatTableViewCell : UITableViewCell


@property (nonatomic, strong)UIImageView *iconView;
@property (nonatomic, strong)UIImageView *bgView;
@property (nonatomic, strong)UILabel *messageLabel;
@property (nonatomic, strong)MLChatFrameModel *frameModel;
@property (nonatomic, strong)UILabel *timeLabel;
//@property (nonatomic, assign)NSInteger timeCount;
@end

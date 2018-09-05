//
//  MLChatTableViewCell.m
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/4.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLChatTableViewCell.h"

@implementation MLChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configureCellView];
    }
    return self;
}

- (void)configureCellView {
    self.iconView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.iconView.backgroundColor = [UIColor magentaColor];
    [self.contentView addSubview:self.iconView];
    
    self.bgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:self.bgView];
    
    self.messageLabel = [BLGeneralControl createUILabelWithColor:[UIColor blackColor] Font:17.0 textAlignment:NSTextAlignmentLeft fromView:self.bgView];
    self.messageLabel.numberOfLines = 0;
    
    UILabel *timeLabel = [BLGeneralControl createUILabelWithColor:[UIColor blackColor] Font:17.0 textAlignment:NSTextAlignmentLeft fromView:self.bgView];
    timeLabel.frame = CGRectMake(0, 0, kScreen_width, 2*BLControlGap);

   __block NSInteger timeCount = arc4random()%100;
        //    开启计时器
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        timeCount ++;
      timeLabel.text = [NSString stringWithFormat:@"%ld",timeCount];
        
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    NSLog(@"==================%@",[[NSRunLoop currentRunLoop] currentMode]);
    }


- (void)setFrameModel:(MLChatFrameModel *)frameModel {
    _frameModel = frameModel;
    self.iconView.frame = _frameModel.imageFrame;
    self.bgView.frame = _frameModel.bubblesFrame;
    self.messageLabel.frame = _frameModel.titleFrame;
    
    UIImage *image = [UIImage imageNamed:_frameModel.model.picture];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    self.bgView.image = image;
    self.messageLabel.text = _frameModel.model.title;
}
@end

//
//  MLChatViewController.m
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/4.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "MLChatViewController.h"
#import "MLChatTableViewCell.h"
#import "MLChatModel.h"
#import "MLChatFrameModel.h"
#import "MLBottomView.h"
static NSString *cellID = @"cellID";
@interface MLChatViewController ()<UITableViewDelegate,UITableViewDataSource,InputDelegate>

@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *directionArray;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *tempArray;
@property (nonatomic,strong)MLBottomView *bottomView;

@end

@implementation MLChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"创建帖子";
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureViews];
    [self setUpBottomView];
}

//1.在页面出现时关闭键盘，在页面消失开启键盘，不影响其他页面键盘的使用
-(void)viewWillAppear:(BOOL)animated {
    
    //关闭键盘事件相应
//    [IQKeyboardManager sharedManager].enable = NO;
}

-(void)viewWillDisappear: (BOOL)animated {
    
    //打开键盘事件相应
//    [IQKeyboardManager sharedManager].enable = YES;
}

- (void)configureViews {
    
    
    self.tempArray = [NSMutableArray array];
    for (int i=0; i < self.titleArray.count; i++) {
        MLChatModel *model = [MLChatModel new];
        model.title = self.titleArray[i];
        model.isLeft = [self.directionArray[i] boolValue];
        MLChatFrameModel *frameModel = [MLChatFrameModel new];
        frameModel.model = model;
        [self.tempArray addObject:frameModel];
    }
    
    [self.tableView registerClass:NSClassFromString(@"MLChatTableViewCell") forCellReuseIdentifier:cellID];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

//布局底部视图
- (void)setUpBottomView {
    self.bottomView = [[MLBottomView alloc]initWithFrame:CGRectMake(0, kScreen_height-49, kScreen_width, 49)];
    self.bottomView.delegate = self;
    [self.view addSubview:self.bottomView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tempArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MLChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.frameModel = self.tempArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MLChatFrameModel *frameModel = self.tempArray[indexPath.row];
    return frameModel.height;
}

- (void)InputBounced:(CGFloat)height time:(CGFloat)time {
   
    [UIView animateWithDuration:time animations:^{
    self.bottomView.transform = CGAffineTransformMakeTranslation(0, -height);
    self.tableView.transform = CGAffineTransformMakeTranslation(0, -height);
    }];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.tempArray.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

}

- (void)hidenBounced:(CGFloat)height time:(CGFloat)time {
    [UIView animateWithDuration:1 animations:^{
    self.bottomView.transform = CGAffineTransformIdentity;
    self.tableView.transform = CGAffineTransformIdentity;
    }];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.tempArray.count inSection:0];
    MLChatModel *model = [MLChatModel new];
    model.title = self.bottomView.textView.text;
    model.isLeft = NO;
    MLChatFrameModel *frameModel = [MLChatFrameModel new];
    frameModel.model = model;
    [self.tempArray addObject:frameModel];
    self.bottomView.textView.text = @"";
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"==================%@",[[NSRunLoop currentRunLoop] currentMode]);
}

- (NSArray*)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"天王盖地虎",@"宝塔镇河妖",@"回忆总想哭",@"一个人太孤独",@"大吉大利",@"今晚吃鸡",@"大吉大利大吉大利大吉大利大吉大利大吉大利大吉大利大吉大利大吉大利大吉大利大吉大利大吉大利",@"今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡今晚吃鸡",@"天王盖地虎",@"宝塔镇河妖",@"回忆总想哭",@"一个人太孤独",@"大吉大利",@"今晚吃鸡"];
    }
    return _titleArray;
}

- (NSArray*)directionArray {
    if (!_directionArray) {
        _directionArray = @[@"YES",@"NO",@"YES",@"NO",@"YES",@"NO",@"YES",@"NO",@"YES",@"NO",@"YES",@"NO",@"YES",@"NO"];
    }
    return _directionArray;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreen_width, kScreen_height-64-49) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end

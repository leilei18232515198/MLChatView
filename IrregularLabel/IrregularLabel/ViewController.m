//
//  ViewController.m
//  IrregularLabel
//
//  Created by 268Edu on 2018/4/3.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "ViewController.h"
#import "MLlabel.h"
#import "MLChatViewController.h"
@interface ViewController ()
@property (nonatomic,strong)MLlabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
self.label = [[MLlabel alloc] initWithFrame:CGRectMake(90, 200, 200, 40)];
    [self.view addSubview:self.label];
    self.label.text = @"这是一个不规则label";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor redColor];
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont boldSystemFontOfSize:16];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UINavigationController *nav = [[UINavigationController alloc] init];
    MLChatViewController *viewController = [[MLChatViewController alloc] init];
    nav.viewControllers = @[viewController];
    [self presentViewController:nav animated:YES completion:nil];
}

@end

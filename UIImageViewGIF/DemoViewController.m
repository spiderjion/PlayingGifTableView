//
//  DemoViewController.m
//  UIImageViewGIF
//
//  Created by YuAo on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DemoViewController.h"
#import "UIImageView+imageViewWithGIF.h"
#import "testViewController.h"

@implementation DemoViewController

- (void)loadView {
    UIView *mainView = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame] autorelease];
    mainView.backgroundColor = [UIColor whiteColor];
    
    NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] 
                                     pathForResource:@"demo"
                                              ofType:@"gif"]];
    UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
    imageView.frame = CGRectMake(90, 100, 100, 100);
    [mainView addSubview:imageView];
    
    NSData *gifData1 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
                                                      pathForResource:@"bbb"
                                                      ofType:@"gif"]];
    UIImageView *imageView1 = [UIImageView imageViewWithGIFData:gifData1];
    imageView1.frame = CGRectMake(90, 0, 100, 100);
    [mainView addSubview:imageView1];
    self.view = mainView;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 10, 70, 40);
    [button setTitle:@"表格测试" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:button];
}

-(IBAction) click:(UIButton*) sender{
    testViewController * detail = [[testViewController alloc] init];
    detail.hidesBottomBarWhenPushed = YES;
    
    detail.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    UINavigationController *vd = [[UINavigationController alloc] initWithRootViewController:detail];
    [vd.navigationBar.topItem setTitle: @"用户注册"];
    [self presentViewController:vd animated:YES completion:^{}];
}
@end

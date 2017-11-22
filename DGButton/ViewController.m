//
//  ViewController.m
//  DGButton
//
//  Created by Cody on 2017/11/22.
//  Copyright © 2017年 Cody. All rights reserved.
//

#import "ViewController.h"
#import "DGButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //标题在图片前面
    DGButton * button10 = [DGButton buttonArrangeType:DGButtonArrangeTypeTitleInFrontOfTheImage];
    button10.frame = CGRectMake(self.view.frame.size.width - 80 -100, 100, 100, 50);
    [button10 setTitle:@"内容过多,自动缩进" forState:UIControlStateNormal];
    [button10 setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [button10 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button10 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button10.imageSize = CGSizeMake(20, 20);
    [button10 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button10];
    button10.backgroundColor = [UIColor grayColor];

    
    return;
    
    //标题在图片前面
    DGButton * button = [DGButton buttonArrangeType:DGButtonArrangeTypeTitleInFrontOfTheImage];
    button.frame = CGRectMake(50, 100, 100, 50);
    [button setTitle:@"标题在前" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button.imageSize = CGSizeMake(20, 20);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor grayColor];
    
    
    
    //图片在标题前面
    DGButton * button1 = [DGButton buttonArrangeType:DGButtonArrangeTypeImageInFrontOfTheTitle];
    button1.frame = CGRectMake(50, 200, 100, 50);
    [button1 setTitle:@"图片在前" forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button1.imageSize = CGSizeMake(20, 20);
    button1.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button1.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [button1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    button1.backgroundColor = [UIColor grayColor];
    
    //标题在图片上面
    DGButton * button2 = [DGButton buttonArrangeType:DGButtonArrangeTypeTitleAboveTheImage];
    button2.frame = CGRectMake(50, 300, 80, 80);
    [button2 setTitle:@"标题在上" forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button2.imageSize = CGSizeMake(40, 40);
    button2.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button2.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [button2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    button2.backgroundColor = [UIColor grayColor];
    
    
    //标题在图片上面
    DGButton * button3 = [DGButton buttonArrangeType:DGButtonArrangeTypeImageAboveTheTitle];
    button3.frame = CGRectMake(50, 400, 80, 80);
    [button3 setTitle:@"图片在上" forState:UIControlStateNormal];
    [button3 setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button3.imageSize = CGSizeMake(40, 40);
    button3.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button3.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [button3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    button3.backgroundColor = [UIColor grayColor];

    
    //标题在图片上面
    DGButton * button4 = [DGButton buttonArrangeType:DGButtonArrangeTypeImageAboveTheTitle];
    button4.frame = CGRectMake(self.view.frame.size.width - 80 -50, 300, 80, 80);
    [button4 setTitle:@"左对齐" forState:UIControlStateNormal];
    [button4 setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button4.imageSize = CGSizeMake(40, 40);
    button4.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button4.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button4.alignmentType = DGButtonAlignmentTypeLeft;//图片、标题左对齐
    [button4 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    button4.backgroundColor = [UIColor grayColor];

    //标题在图片上面
    DGButton * button5 = [DGButton buttonArrangeType:DGButtonArrangeTypeImageAboveTheTitle];
    button5.frame = CGRectMake(self.view.frame.size.width - 80 -50, 400, 80, 80);
    [button5 setTitle:@"右对齐" forState:UIControlStateNormal];
    [button5 setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button5.imageSize = CGSizeMake(40, 40);
    button5.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20);//设置偏移量
    button5.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button5.alignmentType = DGButtonAlignmentTypeRight;//图片、标题右对齐
    [button5 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    button5.backgroundColor = [UIColor grayColor];
}

- (void)btnAction:(DGButton *)sender{
    
}

@end

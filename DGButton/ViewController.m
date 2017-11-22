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
    
    DGButton * button = [DGButton buttonArrangeType:DGButtonArrangeTypeTitleInFrontOfTheImage];
    button.frame = CGRectMake(100, 200, 100, 80);
    [button setTitle:@"DGButton" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    button.imageSize = CGSizeMake(20, 20);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.layer.borderWidth = 1.0f;
    
}

- (void)btnAction:(DGButton *)sender{
    
}

@end

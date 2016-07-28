//
//  ViewController.m
//  MasonryTest
//
//  Created by lijun on 16/7/27.
//  Copyright © 2016年 Youku.com. All rights reserved.
//

#import "ViewController.h"
#import "RegisterUsernameViewController.h"
#import "LoginViewController.h"
#import "MainView.h"
#import "FPUsernameViewController.h"

@interface ViewController ()<MainViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    MainView *mainView = [[MainView alloc] initWithFrame:self.view.bounds];
//    mainView.backgroundColor = [UIColor jk_randomColor];
//    mainView.delegate = self;
//    [self.view addSubview:mainView];
}
- (IBAction)buttonPressed:(UIButton *)sender {
    
//    RegisterUsernameViewController *loginViewController = [[RegisterUsernameViewController alloc] initWithFlatNavigationBar];
//    [self.navigationController pushViewController:loginViewController animated:YES];
    
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithFlatNavigationBar];
    [self.navigationController pushViewController:loginViewController animated:YES];
    
    
}

#pragma mark-delegate


@end

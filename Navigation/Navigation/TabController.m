//
//  TabController.m
//  Navigation
//
//  Created by Victor Lisboa on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TabController.h"
#import "DicionarioViewController.h"
#import "TableViewController.h"

@interface TabController ()

@end

@implementation TabController

- (void)viewDidLoad {
    [super viewDidLoad];
//    DicionarioViewController *dic = [[DicionarioViewController alloc]initWithNibName:nil bundle:nil];
//    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:dic];
//    TableViewController *table = [[TableViewController alloc]init];
    NSArray *views = [[NSArray alloc]init];
    
    [self setViewControllers:views];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

//
//  firstViewViewController.m
//  speak
//
//  Created by ARES HUANG on 26/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import "firstViewViewController.h"

@interface firstViewViewController ()

@end

@implementation firstViewViewController

- (void)loadView {
    [super loadView];
    NSLog(@"%@", @"load first");
}

- (void)takePhoto: (id)sender {
    NSLog(@"%@ %@", @"5 seconds later", sender);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    red = [[UIColor alloc]initWithRed:1 green:0 blue:0 alpha:1];
    green = [[UIColor alloc]initWithRed:0 green:1 blue:0 alpha:1];
    colors = @[red,green];
    self.view.backgroundColor = colors[0];
    [self performSelector:@selector(takePhoto:) withObject:self afterDelay:5];
    NSLog(@"%@", @"loaded first");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self.view.backgroundColor isEqual:colors[0]]) {
        self.view.backgroundColor = colors[1];
    } else {
        self.view.backgroundColor = colors[0];
    }
    NSLog(@"%@", @"first will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    NSLog(@"%@", @"first did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@", @"first will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@", @"fisrt did disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

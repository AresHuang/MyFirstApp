//
//  MyFirstIOSViewController.m
//  MyFirstIOSApp
//
//  Created by ARES HUANG on 17/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import "MyFirstIOSViewController.h"
#import "MyFirstClass.h"

@interface MyFirstIOSViewController ()

@end

@implementation MyFirstIOSViewController
int price = 100;

-(void)test:(MyFirstClass *)cuteBaby {
    [cuteBaby eat:@"a" and:@"b"];
}

- (IBAction)testAction:(id)sender {
    NSString *name = @"ttt";
    MyFirstClass *obj = [[MyFirstClass alloc] init];
    [self test:obj];
    [self test:@"hello"];
    [obj noimp];

    NSLog([name stringByReplacingOccurrencesOfString:@"t" withString:star1TextField.text]);
    if ([star1TextField.text isEqualToString:@"abc"]) {
        yes.hidden = NO;
        no.hidden  = YES;
    } else {
        yes.hidden = YES;
        no.hidden  = NO;
    }
    
    if (abc.selectedSegmentIndex == 0) {
        [star1TextField insertText:@"a"];
    } else if (abc.selectedSegmentIndex == 1) {
        [star1TextField insertText:@"b"];
    } else {
        star1TextField.text = @"";
        star1TextField.text = [NSString stringWithFormat:@"%d", price];
    }
    
    if (step) {
        price++;
    } else {
        price--;
    }
    UIImage *img = [UIImage imageNamed:@"snoopy"];
    [image setImage:img];
}

- (IBAction)rgbSliderChanged:(id)sender {
    snoopy.backgroundColor = [UIColor colorWithRed:red.value green:green.value blue:blue.value alpha:1];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

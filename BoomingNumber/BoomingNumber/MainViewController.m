//
//  MainViewController.m
//  BoomingNumber
//
//  Created by ARES HUANG on 28/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import "MainViewController.h"
#import "UILabel+dynamicSizeMe.h"
@import GameplayKit;

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    _inputButton.enabled = FALSE;
    _warningMessage.hidden = TRUE;
    _historyMessage.hidden = TRUE;
    _playAgainButton.hidden = TRUE;
    [_historyMessage setText:@""];
    [_inputNumber addTarget:self action:@selector(inputNumberEditingChanged) forControlEvents:UIControlEventEditingChanged];
    historicalNumber = [[NSMutableArray alloc] init];
    maxPlayCount = 10;
    maxNumber = 100;
    minNumber = 0;
    GKRandomDistribution *distribution = [GKRandomDistribution distributionWithLowestValue:minNumber highestValue:maxNumber];
    boomingNumber = [distribution nextInt];
    NSLog(@"boomingNumber is %ld", boomingNumber);
    inputMessageTemplate = @"Please input a number\n請輸入密碼 ( min - max )";
    warningMessageTemplate = @"Please input a number between min and max.";
    boomingNumberMessageTemplate = @"Bomming number is \n（終極密碼是） (boomingNumber)";
    [self updateMinMaxMessage];
}

- (void)updateMinMaxMessage {
    if (minNumber == maxNumber) {
        [_inputMessage setText:[inputMessageTemplate stringByReplacingOccurrencesOfString:@"min - max" withString:[NSString stringWithFormat:@"%ld", minNumber]]];
        [_warningMessage setText:[boomingNumberMessageTemplate stringByReplacingOccurrencesOfString:@"(boomingNumber)" withString:[NSString stringWithFormat:@"%ld", minNumber]]];
    } else {
        [_inputMessage setText:[inputMessageTemplate stringByReplacingOccurrencesOfString:@"min - max" withString:[NSString stringWithFormat:@"%ld - %ld", minNumber, maxNumber]]];
        [_warningMessage setText:[warningMessageTemplate stringByReplacingOccurrencesOfString:@"min and max" withString:[NSString stringWithFormat:@"%ld and %ld", minNumber, maxNumber]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissKeyboard {
    [_inputNumber resignFirstResponder];
}

- (void)inputNumberEditingChanged {
    _inputButton.enabled = ([_inputNumber.text length] > 0);
}

- (IBAction)typeNumber:(id)sender {
    _inputButton.enabled = ([_inputNumber.text length] > 0);
}

- (void)showHistoricalNumber:(NSArray *)numbers {
    NSMutableString *history = [[NSMutableString alloc] initWithString:@""];
    for(NSNumber *number in numbers) {
        [history appendFormat:@"%@\n", number];
    }
    [_historyMessage setText:history];
    [_historyMessage resizeToFit];
    if (_historyMessage.hidden) {
        _historyMessage.hidden = FALSE;
    }
}

- (IBAction)inputButtonPressed:(id)sender {
    if ([_inputNumber.text length] == 0) {
        _warningMessage.hidden = TRUE;
        return;
    }
    NSInteger number = [_inputNumber.text integerValue];
    if (number > maxNumber || number < minNumber) {
        _warningMessage.hidden = FALSE;
        return;
    }
    [historicalNumber addObject:[NSNumber numberWithInteger:number]];
    if (number == boomingNumber) {
        _playAgainButton.hidden = FALSE;
        maxNumber = number;
        minNumber = number;
    } else if (number > boomingNumber) {
        maxNumber = number-1;
    } else {
        minNumber = number+1;
    }
    [self updateMinMaxMessage];
    [self showHistoricalNumber:historicalNumber];
    if ([historicalNumber count] >= maxPlayCount) {
        _playAgainButton.hidden = FALSE;
        _inputButton.enabled = FALSE;
    }
    if (minNumber != boomingNumber) {
        _warningMessage.hidden = TRUE;
    } else {
        _warningMessage.hidden = FALSE;
    }
    [self dismissKeyboard];
    [_inputNumber setText:@""];
    _inputButton.enabled = FALSE;
}

- (IBAction)playAgain:(id)sender {
    [historicalNumber removeAllObjects];
    _historyMessage.hidden = TRUE;
    [_historyMessage setText:@""];
    _playAgainButton.hidden = TRUE;
    _warningMessage.hidden = TRUE;
    maxNumber = 100;
    minNumber = 0;
    [self updateMinMaxMessage];
    GKRandomDistribution *distribution = [GKRandomDistribution distributionWithLowestValue:minNumber highestValue:maxNumber];
    boomingNumber = [distribution nextInt];
    NSLog(@"boomingNumber is %ld", boomingNumber);
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

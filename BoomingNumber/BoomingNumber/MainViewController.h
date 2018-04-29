//
//  MainViewController.h
//  BoomingNumber
//
//  Created by ARES HUANG on 28/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController {
    NSInteger maxPlayCount;
    NSInteger maxNumber;
    NSInteger minNumber;
    NSInteger boomingNumber;
    NSMutableArray *historicalNumber;
    NSString *warningMessageTemplate;
    NSString *inputMessageTemplate;
    NSString *boomingNumberMessageTemplate;

}

@property (weak, nonatomic) IBOutlet UITextField *inputNumber;
@property (weak, nonatomic) IBOutlet UILabel *inputMessage;
@property (weak, nonatomic) IBOutlet UIButton *inputButton;
@property (weak, nonatomic) IBOutlet UILabel *warningMessage;
@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;
@property (weak, nonatomic) IBOutlet UILabel *historyMessage;
- (void)dismissKeyboard;
- (void)inputNumberEditingChanged;
- (void)showHistoricalNumber:(NSArray *)numbers;
- (void)updateMinMaxMessage;

@end

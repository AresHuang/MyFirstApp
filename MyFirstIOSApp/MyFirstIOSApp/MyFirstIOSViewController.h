//
//  MyFirstIOSViewController.h
//  MyFirstIOSApp
//
//  Created by ARES HUANG on 17/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFirstIOSViewController : UIViewController {
    
    __weak IBOutlet UITextField *star1TextField;
    __weak IBOutlet UILabel *yes;
    __weak IBOutlet UILabel *no;
    __weak IBOutlet UISegmentedControl *abc;
    __weak IBOutlet UIStepper *step;
    __weak IBOutlet UIImageView *image;
    
    __weak IBOutlet UIImageView *snoopy;
    __weak IBOutlet UISlider *red;
    __weak IBOutlet UISlider *green;
    __weak IBOutlet UISlider *blue;
    __weak IBOutlet UILabel *redvalue;
    __weak IBOutlet UILabel *greenvalue;
    __weak IBOutlet UILabel *blueValue;

}

@end

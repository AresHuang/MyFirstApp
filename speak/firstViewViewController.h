//
//  firstViewViewController.h
//  speak
//
//  Created by ARES HUANG on 26/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface firstViewViewController : UIViewController {
UIColor *red;
UIColor *green;
NSArray<UIColor *> *colors;
}
@property (weak, nonatomic) IBOutlet UITextField *input;

@end

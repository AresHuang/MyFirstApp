//
//  baby.h
//  speak
//
//  Created by ARES HUANG on 24/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Baby : NSObject
{
    NSString *name;
}
@property(nonatomic,assign) int age;
@property(nonatomic,copy) NSString *name;
- (void)dealloc;
@end

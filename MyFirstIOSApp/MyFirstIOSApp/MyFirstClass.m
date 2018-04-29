//
//  MyFirstClass.m
//  MyFirstIOSApp
//
//  Created by ARES HUANG on 17/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import "MyFirstClass.h"

@implementation MyFirstClass

- (instancetype)init {
    self = [super init];
    if (self) {
        age = 1;
    }
    return self;
}
- (instancetype)initWithAge:(int)age {
    self = [super init];
    if (self) {
        age = 1;
    }
    return self;
}

- (void)eat: (NSString*)p1 and: (NSString*)p2 {
    
}

@end

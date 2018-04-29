//
//  MyFirstClass.h
//  MyFirstIOSApp
//
//  Created by ARES HUANG on 17/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFirstClass : NSObject {
    int age;
    NSString *name;
}
- (instancetype)initWithAge:(int)age;
- (void) eat:(NSString*)p1 and: (NSString*)p2;
- (void) noimp;

@end

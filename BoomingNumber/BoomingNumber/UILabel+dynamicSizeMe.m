//
//  UILabel+dynamicSizeMe.m
//  BoomingNumber
//
//  Created by ARES HUANG on 29/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import "UILabel+dynamicSizeMe.h"

@implementation UILabel (dynamicSizeMe)

-(float)resizeToFit{
    float height = [self expectedHeight];
    CGRect newFrame = [self frame];
    newFrame.size.height = height;
    [self setFrame:newFrame];
    return newFrame.origin.y + newFrame.size.height;
}

-(float)expectedHeight{
    [self setNumberOfLines:0];
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize maximumLabelSize = CGSizeMake(self.frame.size.width,9999);
    UIFont *fontText = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    CGRect expectedLabelSize = [[self text] boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:fontText} context:nil];
    return expectedLabelSize.size.height;
}

@end

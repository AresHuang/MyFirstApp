//
//  GameScene.m
//  speak
//
//  Created by ARES HUANG on 24/04/2018.
//  Copyright © 2018 ARES HUANG. All rights reserved.
//

#import "GameScene.h"
@import AVFoundation;
@import GameplayKit;
#import "baby.h"
#import "Dog.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    // Get label node from scene and store it for use later
    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    
    _label.alpha = 0.0;
    [_label runAction:[SKAction fadeInWithDuration:2.0]];
    
    CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
    _spinnyNode.lineWidth = 2.5;
    
    [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
    [_spinnyNode runAction:[SKAction sequence:@[
                                                [SKAction waitForDuration:0.5],
                                                [SKAction fadeOutWithDuration:0.5],
                                                [SKAction removeFromParent],
                                                ]]];
}


- (void)touchDownAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor greenColor];
    [self addChild:n];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor blueColor];
    [self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor redColor];
    [self addChild:n];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
    [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
    
    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"hello world"];
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    [synthesizer speakUtterance:utterance];
    AVSpeechUtterance *utterance2 = [AVSpeechUtterance speechUtteranceWithString:@"哈囉世界"];
    utterance2.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-TW"];
    AVSpeechSynthesizer *synthesizer2 = [[AVSpeechSynthesizer alloc] init];
    [synthesizer2 speakUtterance:utterance2];
//    if (array == nil) {
//        array = [[NSMutableArray alloc] init];
//        int i;
//        for(i= 0; i<10000000; i++)
//        {
//            NSString *leakString = [[NSString alloc] initWithString:@"this is a test"];
//            [array addObject:leakString];
//        }
//    }
//    __weak Baby *baby = [[Baby alloc]init];
//    baby.name = @"Hello";
//    NSLog(@"%@", baby.name);
    GKRandomDistribution *rand = [GKRandomDistribution distributionWithLowestValue:0 highestValue:3];
    int one = 0;
    for(int i=0; i<1000; i++) {
        Boolean b = [rand nextBool];
        NSLog(@"%u", b);
        if (b) {
            one++;
        }
    }
    NSLog(@"%d", one);
    GKShuffledDistribution *stack = [GKShuffledDistribution distributionWithLowestValue:1 highestValue:21];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end

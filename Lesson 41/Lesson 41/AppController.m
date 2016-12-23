//
//  AppController.m
//  Lesson 41
//
//  Created by Lucas Derraugh on 6/2/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"

@implementation AppController {
    NSInteger _squareCount;
}

- (void)awakeFromNib {
    self.squareView.delegate = self;
    _squareCount = 10;
    [self.squareView setNeedsDisplay:YES];
}

- (void)changeSquareCount:(NSSlider *)sender {
    _squareCount = sender.intValue;
    [self.squareView setNeedsDisplay:YES];
}

- (NSInteger)numberOfSquaresInSquareView:(SquareView *)squareView {
    return _squareCount;
}

@end

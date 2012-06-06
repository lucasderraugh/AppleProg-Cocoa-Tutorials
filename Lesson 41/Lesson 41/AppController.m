//
//  AppController.m
//  Lesson 41
//
//  Created by Lucas Derraugh on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController {
    int _squareCount;
}
@synthesize squareView = _squareView;

- (void)awakeFromNib {
    [_squareView setDelegate:self];
    _squareCount = 10;
    [_squareView setNeedsDisplay:YES];
}

- (void)changeSquareCount:(id)sender {
    _squareCount = [sender intValue];
    [_squareView setNeedsDisplay:YES];
}

- (int)numberOfSquaresInSquareView:(SquareView *)squareView {
    return _squareCount;
}

@end

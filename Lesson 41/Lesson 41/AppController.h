//
//  AppController.h
//  Lesson 41
//
//  Created by Lucas Derraugh on 6/2/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SquareView.h"

@interface AppController : NSObject <SquareViewDelegate>

@property (weak) IBOutlet SquareView *squareView;

- (IBAction)changeSquareCount:(NSSlider *)sender;

@end

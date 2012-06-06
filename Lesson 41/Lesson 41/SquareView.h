//
//  SquareView.h
//  Lesson 41
//
//  Created by Lucas Derraugh on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class SquareView;

@protocol SquareViewDelegate <NSObject>

- (int)numberOfSquaresInSquareView:(SquareView *)squareView;

@end

@interface SquareView : NSView

@property (weak) id<SquareViewDelegate> delegate;

@end

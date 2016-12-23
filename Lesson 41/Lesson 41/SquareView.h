//
//  SquareView.h
//  Lesson 41
//
//  Created by Lucas Derraugh on 6/2/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol SquareViewDelegate;

@interface SquareView : NSView

@property (weak) id<SquareViewDelegate> delegate;

@end


@protocol SquareViewDelegate <NSObject>

- (NSInteger)numberOfSquaresInSquareView:(SquareView *)squareView;

@end

//
//  RectangleView.h
//  Lesson 27
//
//  Created by Lucas Derraugh on 12/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RectangleView : NSView {
    NSPoint startPoint;
    NSPoint endPoint;
    BOOL isOval;
}

@end

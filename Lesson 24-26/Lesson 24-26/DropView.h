//
//  DropView.h
//  Lesson 24-26
//
//  Created by Lucas Derraugh on 3/4/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DropView : NSView <NSDraggingDestination>

@property NSImage *image;

@end

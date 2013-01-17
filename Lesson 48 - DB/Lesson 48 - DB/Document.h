//
//  Document.h
//  Lesson 48 - DB
//
//  Created by Lucas Derraugh on 1/15/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CoolView.h"

@interface Document : NSDocument

@property (weak) IBOutlet CoolView *coolView;

@end

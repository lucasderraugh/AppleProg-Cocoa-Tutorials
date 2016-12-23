//
//  DesktopEntity.h
//  Lesson 59
//
//  Created by Lucas Derraugh on 8/2/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DesktopEntity : NSObject

@property (strong, nonatomic) NSURL *fileURL;
@property (copy, readonly) NSString *name;
@property (strong, nonatomic) NSImage *image;

- (instancetype)initWithFileURL:(NSURL *)fileURL;

@end

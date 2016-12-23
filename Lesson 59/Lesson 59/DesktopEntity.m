//
//  DesktopEntity.m
//  Lesson 59
//
//  Created by Lucas Derraugh on 8/2/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "DesktopEntity.h"

@implementation DesktopEntity

- (instancetype)initWithFileURL:(NSURL *)fileURL {
    if (self = [super init]) {
        _fileURL = fileURL;
    }
    return self;
}

- (NSString *)name {
    NSString *name;
    if ([self.fileURL getResourceValue:&name forKey:NSURLLocalizedNameKey error:NULL]) {
        return name;
    }
    return nil;
}

- (NSImage *)image {
    if (!_image) {
        _image = [[NSImage alloc] initByReferencingURL:self.fileURL];
    }
    return _image;
}

@end

//
//  DesktopEntity.m
//  Lesson 53
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

+ (DesktopEntity *)entityForURL:(NSURL *)url {
    NSString *typeIdentifier;
    if ([url getResourceValue:&typeIdentifier forKey:NSURLTypeIdentifierKey error:NULL]) {
        NSArray *imgTypes = [NSImage imageTypes];
        if ([imgTypes containsObject:typeIdentifier]) {
            return [[DesktopImageEntity alloc] initWithFileURL:url];
        } else if ([typeIdentifier isEqualToString:(NSString *)kUTTypeFolder]) {
            return [[DesktopFolderEntity alloc] initWithFileURL:url];
        }
    }
    return nil;
}

- (NSString *)name {
    NSString *name;
    if ([self.fileURL getResourceValue:&name forKey:NSURLLocalizedNameKey error:NULL]) {
        return name;
    }
    return nil;
}

#pragma mark NSPasteboardWriting

- (NSPasteboardWritingOptions)writingOptionsForType:(NSString *)type pasteboard:(NSPasteboard *)pasteboard {
    return [self.fileURL writingOptionsForType:type pasteboard:pasteboard];
}

- (NSArray *)writableTypesForPasteboard:(NSPasteboard *)pasteboard {
    return [self.fileURL writableTypesForPasteboard:pasteboard];
}

- (id)pasteboardPropertyListForType:(NSString *)type {
    return [self.fileURL pasteboardPropertyListForType:type];
}

#pragma mark NSPasteboardReading

+ (NSArray *)readableTypesForPasteboard:(NSPasteboard *)pasteboard {
    return @[(id)kUTTypeFolder, (id)kUTTypeFileURL];
}

+ (NSPasteboardReadingOptions)readingOptionsForType:(NSString *)type pasteboard:(NSPasteboard *)pasteboard {
    return NSPasteboardReadingAsString;
}

- (id)initWithPasteboardPropertyList:(id)propertyList ofType:(NSString *)type {
    NSURL *url = [[NSURL alloc] initWithPasteboardPropertyList:propertyList ofType:type];
    self = [DesktopEntity entityForURL:url];
    return self;
}

@end


@implementation DesktopImageEntity

- (NSImage *)image {
    if (!_image) {
        _image = [[NSImage alloc] initByReferencingURL:self.fileURL];
    }
    return _image;
}

@end


@implementation DesktopFolderEntity

@end




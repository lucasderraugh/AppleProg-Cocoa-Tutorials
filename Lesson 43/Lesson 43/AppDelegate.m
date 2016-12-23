//
//  AppDelegate.m
//  Lesson 43
//
//  Created by Lucas Derraugh on 8/3/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSButton *shareButton;
@property (weak) IBOutlet NSTextView *textView;
@property (weak) IBOutlet NSImageView *imageView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.shareButton.image = [NSImage imageNamed:NSImageNameShareTemplate];
    [self.shareButton sendActionOn:NSEventMaskLeftMouseDown];
}

- (IBAction)shareToService:(id)sender
{
    NSMutableArray *shareItems = [NSMutableArray arrayWithObject:self.textView.string];
    NSImage *image = self.imageView.image;
    if (image) {
        [shareItems addObject:image];
    }
    NSSharingServicePicker *sharingPicker = [[NSSharingServicePicker alloc] initWithItems:shareItems];
    sharingPicker.delegate = self;
    [sharingPicker showRelativeToRect:self.shareButton.bounds ofView:self.shareButton preferredEdge:NSMinYEdge];
}

#pragma mark Sharing Service Picker Delegate methods

- (id<NSSharingServiceDelegate>)sharingServicePicker:(NSSharingServicePicker *)sharingServicePicker
                           delegateForSharingService:(NSSharingService *)sharingService
{
    return self;
}

#pragma mark Sharing Service Delegate methods

- (NSWindow *)sharingService:(NSSharingService *)sharingService sourceWindowForShareItems:(NSArray *)items sharingContentScope:(NSSharingContentScope *)sharingContentScope
{
    return self.window;
}

- (NSRect)sharingService:(NSSharingService *)sharingService sourceFrameOnScreenForShareItem:(id<NSPasteboardWriting>)item
{
    NSSize size = [[self.imageView image] size];
    NSRect frame = NSMakeRect(0, 0-size.height, size.width, size.height);
    return frame;
}

- (NSImage *)sharingService:(NSSharingService *)sharingService transitionImageForShareItem:(id<NSPasteboardWriting>)item contentRect:(NSRect *)contentRect
{
    return self.imageView.image;
}

- (NSArray *)sharingServicePicker:(NSSharingServicePicker *)sharingServicePicker
          sharingServicesForItems:(NSArray *)items
          proposedSharingServices:(NSArray *)proposedServices
{
    NSArray *services = proposedServices;
    NSString *theFirstString;
    
    for (id item in items) {
        if ([item isKindOfClass:[NSString class]]) {
            theFirstString = item;
            break;
        }
    }
    
    if (theFirstString) {
        NSSharingService *customService = [[NSSharingService alloc] initWithTitle:@"Log the first string"
                                                                            image:[NSImage imageNamed:@"egg16"]
                                                                   alternateImage:nil
                                                                          handler:^{
            NSLog(@"The first string: %@", theFirstString);
        }];
        
        services = [services arrayByAddingObject:customService];
    }
    
    return services;
}

@end

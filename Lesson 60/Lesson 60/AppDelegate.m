//
//  AppDelegate.m
//  Lesson 60
//
//  Created by Lucas Derraugh on 7/19/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"
#import <Quartz/Quartz.h>
#import "QuickLookTableView.h"

@interface AppDelegate () <NSTableViewDataSource, NSTableViewDelegate, QuickLookTableViewDelegate, QLPreviewPanelDataSource, QLPreviewPanelDelegate>

@property (nonatomic, weak) IBOutlet NSTableView *tableView;
@property (nonatomic, copy) NSArray *files;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSURL *homeFolder = [NSURL fileURLWithPath:[@"~" stringByExpandingTildeInPath]];
    NSFileManager *manager = [NSFileManager defaultManager];
    self.files = [manager contentsOfDirectoryAtURL:homeFolder
                        includingPropertiesForKeys:[NSArray arrayWithObject:NSURLNameKey]
                                           options:NSDirectoryEnumerationSkipsHiddenFiles
                                             error:nil];
    [self.tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.files count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"Cell" owner:self];
    [cell.textField setStringValue:self.files[row]];
    return cell;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    if ([self.tableView isEqual:[notification object]]) {
        if ([QLPreviewPanel sharedPreviewPanelExists] && [[QLPreviewPanel sharedPreviewPanel] isVisible]) {
            [[QLPreviewPanel sharedPreviewPanel] reloadData];
        }
    }
}

- (void)didPressSpacebarForTableView:(NSTableView *)tableView {
    if ([QLPreviewPanel sharedPreviewPanelExists] && [[QLPreviewPanel sharedPreviewPanel] isVisible]) {
        [[QLPreviewPanel sharedPreviewPanel] orderOut:nil];
    } else {
        [[QLPreviewPanel sharedPreviewPanel] makeKeyAndOrderFront:nil];
        [[QLPreviewPanel sharedPreviewPanel] reloadData];
    }
}

- (NSInteger)numberOfPreviewItemsInPreviewPanel:(QLPreviewPanel *)panel {
    return [[self.files objectsAtIndexes:[self.tableView selectedRowIndexes]] count];
}

- (id<QLPreviewItem>)previewPanel:(QLPreviewPanel *)panel previewItemAtIndex:(NSInteger)index {
    return [self.files objectsAtIndexes:[self.tableView selectedRowIndexes]][index];
}

- (BOOL)acceptsPreviewPanelControl:(QLPreviewPanel *)panel {
    return YES;
}

- (void)beginPreviewPanelControl:(QLPreviewPanel *)panel {
    panel.dataSource = self;
    panel.delegate = self;
}

- (void)endPreviewPanelControl:(QLPreviewPanel *)panel {
    panel.dataSource = nil;
    panel.delegate = nil;
}

- (BOOL)previewPanel:(QLPreviewPanel *)panel handleEvent:(NSEvent *)event {
    if ([event type] == NSKeyDown) {
        [self.tableView keyDown:event];
        return YES;
    }
    return NO;
}

@end

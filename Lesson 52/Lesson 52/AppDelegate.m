//
//  AppDelegate.m
//  Lesson 52
//
//  Created by Lucas Derraugh on 4/6/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate {
    NSMutableArray *_tableContents;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    _tableContents = [[NSMutableArray alloc] init];
    NSString *path = @"/Library/Application Support/Apple/iChat Icons/Flags";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *directoryEnum = [fileManager enumeratorAtPath:path];
    
    NSString *file;
    while (file = [directoryEnum nextObject]) {
        NSString *filePath = [path stringByAppendingFormat:@"/%@", file];
        NSDictionary *obj = @{@"image": [[NSImage alloc] initByReferencingFile:filePath],
                              @"name": [file stringByDeletingPathExtension],
                              @"filePath": filePath};
        [_tableContents addObject:obj];
    }
    [_tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [_tableContents count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSDictionary *flag = _tableContents[row];
    NSString *identifier = [tableColumn identifier];
    if ([identifier isEqualToString:@"MainCell"]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"MainCell" owner:self];
        [cellView.textField setStringValue:flag[@"name"]];
        [cellView.imageView setImage:flag[@"image"]];
        return cellView;
    }
    return nil;
}

- (IBAction)insertNewRow:(id)sender {
    NSDictionary *obj = @{@"name": @"Temp Row Name"};
    NSInteger index = [_tableView selectedRow];
    index++;
    
    [_tableContents insertObject:obj atIndex:index];
    [_tableView beginUpdates];
    [_tableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:index] withAnimation:NSTableViewAnimationSlideDown];
    [_tableView scrollRowToVisible:index];
    [_tableView endUpdates];
}

- (IBAction)removeSelectedRows:(id)sender {
    NSIndexSet *indexes = [_tableView selectedRowIndexes];
    [_tableContents removeObjectsAtIndexes:indexes];
    [_tableView removeRowsAtIndexes:indexes withAnimation:NSTableViewAnimationSlideDown];
}

- (IBAction)locateInFinder:(id)sender {
    NSInteger selectedRow = [_tableView rowForView:sender];
    NSDictionary *obj = _tableContents[selectedRow];
    [[NSWorkspace sharedWorkspace] selectFile:obj[@"filePath"] inFileViewerRootedAtPath:nil];
}

@end

//
//  AppDelegate.m
//  Lesson 52
//
//  Created by Lucas Derraugh on 4/6/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property NSMutableArray *tableContents;

@end

@implementation AppDelegate

NSString *const kNameKey = @"name";
NSString *const kImageKey = @"image";
NSString *const kFilePathKey = @"filePath";
NSString *const kCellIdentifier = @"MainCell";

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    _tableContents = [[NSMutableArray alloc] init];
    NSString *path = @"/Library/Application Support/Apple/iChat Icons/Flags";
    NSFileManager *fileManager = NSFileManager.defaultManager;
    NSDirectoryEnumerator *directoryEnum = [fileManager enumeratorAtPath:path];
    
    NSString *file;
    while (file = [directoryEnum nextObject]) {
        NSString *filePath = [path stringByAppendingFormat:@"/%@", file];
        NSDictionary *obj = @{kImageKey: [[NSImage alloc] initByReferencingFile:filePath],
                              kNameKey: [file stringByDeletingPathExtension],
                              kFilePathKey: filePath};
        [self.tableContents addObject:obj];
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.tableContents.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSDictionary *flag = self.tableContents[row];
    if ([tableColumn.identifier isEqualToString:kCellIdentifier]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:kCellIdentifier owner:self];
        cellView.textField.stringValue = flag[kNameKey];
        cellView.imageView.image = flag[kImageKey];
        return cellView;
    }
    return nil;
}

- (IBAction)insertNewRow:(id)sender {
    NSTableView *tableView = self.tableView;
    NSInteger index = tableView.selectedRow + 1;
    
    self.tableContents[index] = @{kNameKey: @"Temp Row Name"};
    [tableView beginUpdates];
    [tableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:index] withAnimation:NSTableViewAnimationSlideDown];
    [tableView scrollRowToVisible:index];
    [tableView endUpdates];
}

- (IBAction)removeSelectedRows:(id)sender {
    NSTableView *tableView = self.tableView;
    NSIndexSet *indexes = tableView.selectedRowIndexes;
    [self.tableContents removeObjectsAtIndexes:indexes];
    [tableView removeRowsAtIndexes:indexes withAnimation:NSTableViewAnimationSlideDown];
}

- (IBAction)locateInFinder:(id)sender {
    NSInteger selectedRow = [self.tableView rowForView:sender];
    NSDictionary *obj = self.tableContents[selectedRow];
    [[NSWorkspace sharedWorkspace] selectFile:obj[kFilePathKey] inFileViewerRootedAtPath:@""];
}

@end

//
//  AppDelegate.m
//  Lesson 53
//
//  Created by Lucas Derraugh on 4/26/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"
#import "DesktopEntity.h"

@implementation AppDelegate {
    NSMutableArray *_tableContents;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    _tableContents = [[NSMutableArray alloc] init];
    NSString *path = @"/Library/Application Support/Apple/iChat Icons/";
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *directoryEnum = [fileManager enumeratorAtURL:url
                                             includingPropertiesForKeys:nil
                                                                options:0
                                                           errorHandler:^BOOL(NSURL *url, NSError *error) {
                                                               return YES;
                                                           }];
    
    for (NSURL *fileURL in directoryEnum) {
        DesktopEntity *entity = [DesktopEntity entityForURL:fileURL];
        if ([entity isKindOfClass:[DesktopEntity class]])
            [_tableContents addObject:entity];
    }
    [_tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [_tableContents count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    DesktopEntity *entity = _tableContents[row];
    if ([entity isKindOfClass:[DesktopFolderEntity class]]) {
        NSTextField *groupCell = [tableView makeViewWithIdentifier:@"GroupCell" owner:self];
        [groupCell setStringValue:entity.name];
        return groupCell;
    } if ([entity isKindOfClass:[DesktopImageEntity class]]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"ImageCell" owner:self];
        [cellView.textField setStringValue:entity.name];
        [cellView.imageView setImage:[(DesktopImageEntity *)entity image]];
        return cellView;
    }
    return nil;
}

- (BOOL)tableView:(NSTableView *)tableView isGroupRow:(NSInteger)row {
    DesktopEntity *entity = _tableContents[row];
    if ([entity isKindOfClass:[DesktopFolderEntity class]]) {
        return YES;
    }
    return NO;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    DesktopEntity *entity = _tableContents[row];
    if ([entity isKindOfClass:[DesktopFolderEntity class]]) {
        return 22;
    }
    return [tableView rowHeight];
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
    DesktopEntity *entity = _tableContents[selectedRow];
    [[NSWorkspace sharedWorkspace] selectFile:[entity.fileURL path] inFileViewerRootedAtPath:nil];
}


@end

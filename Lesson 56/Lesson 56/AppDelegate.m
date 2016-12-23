//
//  AppDelegate.m
//  Lesson 55
//
//  Created by Lucas Derraugh on 8/17/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"
#import "DesktopEntity.h"

@interface AppDelegate ()

@property NSMutableArray *tableContents;

@end

@implementation AppDelegate

NSString *const kGroupCellIdentifier = @"GroupCell";
NSString *const kImageCellIdentifier = @"ImageCell";

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    _tableContents = [[NSMutableArray alloc] init];
    NSString *path = @"/Library/Application Support/Apple/iChat Icons/";
    NSURL *url = [NSURL fileURLWithPath:path];
    NSFileManager *fileManager = NSFileManager.defaultManager;
    NSDirectoryEnumerator *directoryEnum = [fileManager enumeratorAtURL:url
                                             includingPropertiesForKeys:nil
                                                                options:0
                                                           errorHandler:^BOOL(NSURL *url, NSError *error) {
                                                               return YES;
                                                           }];
    
    for (NSURL *fileURL in directoryEnum) {
        DesktopEntity *entity = [DesktopEntity entityForURL:fileURL];
        if ([entity isKindOfClass:[DesktopEntity class]]) {
            [self.tableContents addObject:entity];
        }
    }
    [self.tableView reloadData];
    [self.tableView registerForDraggedTypes:@[(id)kUTTypeFileURL]];
    [self.tableView setDraggingSourceOperationMask:NSDragOperationEvery forLocal:NO];
}

#pragma mark NSTableView datasource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.tableContents.count;
}

- (id<NSPasteboardWriting>)tableView:(NSTableView *)tableView pasteboardWriterForRow:(NSInteger)row {
    return self.tableContents[row];
}

- (NSDictionary *)pasteboardReadingOptions {
    return @{NSPasteboardURLReadingFileURLsOnlyKey: @YES,
             NSPasteboardURLReadingContentsConformToTypesKey: [NSImage imageTypes]};
}

- (BOOL)containsAcceptableURLsFromPasteboard:(NSPasteboard *)pasteboard {
    return [pasteboard canReadObjectForClasses:@[[NSURL class]]
                                       options:[self pasteboardReadingOptions]];
}

- (NSDragOperation)tableView:(NSTableView *)tableView validateDrop:(id<NSDraggingInfo>)info proposedRow:(NSInteger)row proposedDropOperation:(NSTableViewDropOperation)dropOperation {
    if (dropOperation == NSTableViewDropAbove) {
        if ([info draggingSource] == tableView) {
            // Reorder, implement later
        } else {
            if ([self containsAcceptableURLsFromPasteboard:[info draggingPasteboard]]) {
                info.animatesToDestination = YES;
                return NSDragOperationCopy;
            }
        }
    }
    return NSDragOperationNone;
}

- (void)tableView:(NSTableView *)tableView updateDraggingItemsForDrag:(id<NSDraggingInfo>)draggingInfo {
    if ([draggingInfo draggingSource] != tableView) {
        NSArray<Class> *classes = @[[DesktopEntity class], [NSPasteboardItem class]];
        NSTableCellView *tableCellView = [tableView makeViewWithIdentifier:kImageCellIdentifier owner:self];
        __block NSInteger validCount = 0;
        [draggingInfo enumerateDraggingItemsWithOptions:0 forView:tableView classes:classes searchOptions:@{} usingBlock:^(NSDraggingItem *draggingItem, NSInteger idx, BOOL *stop) {
            if ([draggingItem.item isKindOfClass:[DesktopEntity class]]) {
                DesktopEntity *entity = (DesktopEntity *)draggingItem.item;
                draggingItem.draggingFrame = tableCellView.frame;
                draggingItem.imageComponentsProvider = ^NSArray *{
                    if ([entity isKindOfClass:[DesktopImageEntity class]]) {
                        tableCellView.imageView.image = [(DesktopImageEntity *)entity image];
                    }
                    tableCellView.textField.stringValue = entity.name;
                    return tableCellView.draggingImageComponents;
                };
                validCount++;
            } else {
                draggingItem.imageComponentsProvider = nil;
            }
        }];
        draggingInfo.numberOfValidItemsForDrop = validCount;
        draggingInfo.draggingFormation = NSDraggingFormationList;
    }
}

#pragma mark NSTableView delegate

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    DesktopEntity *entity = self.tableContents[row];
    if ([entity isKindOfClass:[DesktopFolderEntity class]]) {
        NSTextField *groupCell = [tableView makeViewWithIdentifier:kGroupCellIdentifier owner:self];
        groupCell.stringValue = entity.name;
        return groupCell;
    } if ([entity isKindOfClass:[DesktopImageEntity class]]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:kImageCellIdentifier owner:self];
        cellView.textField.stringValue = entity.name;
        cellView.imageView.image = ((DesktopImageEntity *)entity).image;
        return cellView;
    }
    return nil;
}

- (BOOL)tableView:(NSTableView *)tableView isGroupRow:(NSInteger)row {
    DesktopEntity *entity = self.tableContents[row];
    return [entity isKindOfClass:[DesktopFolderEntity class]];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    DesktopEntity *entity = self.tableContents[row];
    return [entity isKindOfClass:[DesktopFolderEntity class]] ? 22 : tableView.rowHeight;
}

- (IBAction)insertNewRow:(id)sender {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.allowsMultipleSelection = YES;
    openPanel.allowedFileTypes = [NSImage imageTypes];
    [openPanel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result) {
        if (result == NSOKButton) {
            NSInteger index = self.tableView.selectedRow;
            index++;
            NSArray *urls = openPanel.URLs;
            [self.tableView beginUpdates];
            for (NSURL *url in urls) {
                DesktopEntity *entity = [DesktopEntity entityForURL:url];
                if (entity) {
                    self.tableContents[index] = entity;
                    [self.tableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:index] withAnimation:NSTableViewAnimationSlideDown];
                    index++;
                }
            }
            [self.tableView endUpdates];
            [self.tableView scrollRowToVisible:index];
        }
    }];
}

- (IBAction)removeSelectedRows:(id)sender {
    NSIndexSet *indexes = self.tableView.selectedRowIndexes;
    [self.tableContents removeObjectsAtIndexes:indexes];
    [self.tableView removeRowsAtIndexes:indexes withAnimation:NSTableViewAnimationSlideDown];
}

- (IBAction)locateInFinder:(id)sender {
    NSInteger selectedRow = [self.tableView rowForView:sender];
    DesktopEntity *entity = self.tableContents[selectedRow];
    [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:@[entity.fileURL]];
}

@end

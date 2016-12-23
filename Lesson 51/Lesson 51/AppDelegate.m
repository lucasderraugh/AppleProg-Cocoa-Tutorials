//
//  AppDelegate.m
//  Lesson 51
//
//  Created by Lucas Derraugh on 3/14/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property NSMutableArray *tableContents;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    _tableContents = [[NSMutableArray alloc] init];
    NSString *path = @"/Library/Application Support/Apple/iChat Icons/Flags";
    NSFileManager *fileManager = NSFileManager.defaultManager;
    NSDirectoryEnumerator *directoryEnum = [fileManager enumeratorAtPath:path];
    
    NSString *file;
    while (file = [directoryEnum nextObject]) {
        NSString *filePath = [path stringByAppendingFormat:@"/%@", file];
        NSDictionary *obj = @{@"image": [[NSImage alloc] initByReferencingFile:filePath],
                              @"name": [file stringByDeletingPathExtension]};
        [self.tableContents addObject:obj];
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.tableContents.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSDictionary *flag = self.tableContents[row];
    if ([tableColumn.identifier isEqualToString:@"MainCell"]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"MainCell" owner:self];
        cellView.textField.stringValue = flag[@"name"];
        cellView.imageView.image = flag[@"image"];
        return cellView;
    }
    return nil;
}

@end

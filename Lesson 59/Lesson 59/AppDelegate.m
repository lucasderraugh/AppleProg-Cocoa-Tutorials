//
//  AppDelegate.m
//  Lesson 59
//
//  Created by Lucas Derraugh on 8/17/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"
#import "DesktopEntity.h"

@implementation AppDelegate

- (NSMutableArray *)tableContents {
    if (_tableContents) return _tableContents;
    
    _tableContents = [[NSMutableArray alloc] init];
    NSString *path = @"/Library/Application Support/Apple/iChat Icons/";
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtURL:url
                                       includingPropertiesForKeys:@[NSURLIsDirectoryKey]
                                                          options:0
                                                     errorHandler:^BOOL(NSURL *url, NSError *error) {
                                                               return YES;
                                                           }];
    
    for (NSURL *fileURL in dirEnum) {
        NSNumber *isDir;
        [fileURL getResourceValue:&isDir forKey:NSURLIsDirectoryKey error:NULL];
        if ([isDir isEqualToNumber:@NO]) {
            DesktopEntity *entity = [[DesktopEntity alloc] initWithFileURL:fileURL];
            [_tableContents addObject:entity];
        }
    }
    return _tableContents;
}

- (IBAction)locateInFinder:(id)sender {
    NSInteger selectedRow = [_tableView rowForView:sender];
    DesktopEntity *entity = _tableContents[selectedRow];
    [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:@[[entity fileURL]]];
}

- (IBAction)remove:(id)sender {
    NSIndexSet *indexes = [_tableView selectedRowIndexes];
    //[_arrayController removeObjectsAtArrangedObjectIndexes:indexes];
    [_tableContents removeObjectsAtIndexes:indexes];
    [_tableView removeRowsAtIndexes:indexes withAnimation:NSTableViewAnimationSlideDown];
}

@end

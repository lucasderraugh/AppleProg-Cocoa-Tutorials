//
//  QuickLookTableView.h
//  Lesson 60
//
//  Created by Lucas Derraugh on 7/24/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol QuickLookTableViewDelegate <NSObject>
@required
- (void)didPressSpacebarForTableView:(NSTableView *)tableView;

@end

@interface QuickLookTableView : NSTableView

@property (nonatomic, weak) IBOutlet id<QuickLookTableViewDelegate> qlDelegate;

@end

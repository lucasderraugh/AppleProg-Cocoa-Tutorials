//
//  OutlineViewController.m
//  Lesson 49
//
//  Created by Lucas Derraugh on 2/22/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "OutlineViewController.h"
#import "Person.h"

@implementation OutlineViewController

- (id)init {
    self = [super init];
    if (self) {
        _people = [[NSMutableArray alloc] init];
        Person *boss = [[Person alloc] initWithName:@"Yoda" age:900];
        [boss addChild:[[Person alloc] initWithName:@"Stephan" age:20]];
        [boss addChild:[[Person alloc] initWithName:@"Taylor" age:18]];
        [boss addChild:[[Person alloc] initWithName:@"Jesse" age:19]];
        
        [(Person *)boss.children[0] addChild:[[Person alloc] initWithName:@"Lucas" age:18]];
        [_people addObject:boss];
    }
    return self;
}

#pragma mark NSOutlineView Data Source Methods

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    return !item ? [self.people count] : [[item children] count];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    return !item ? YES : [[item children] count] != 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    return !item ? self.people[index] : [item children][index];
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
    if ([[tableColumn identifier] isEqualToString:@"name"])
        return [item name];
    else if ([[tableColumn identifier] isEqualToString:@"age"])
        return @([item age]);
    return @"Nobody's Here!";
}

- (void)outlineView:(NSOutlineView *)outlineView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
    if ([[tableColumn identifier] isEqualToString:@"name"]) {
        [(Person *)item setName:object];
    } if ([[tableColumn identifier] isEqualToString:@"age"]) {
        [item setAge:[object intValue]];
    }
}

#pragma mark IBActions

- (IBAction)add:(id)sender {
    Person *p = [self.outlineView itemAtRow:[self.outlineView selectedRow]];
    if (p)
        [p addChild:[[Person alloc] init]];
    else
        [self.people addObject:[[Person alloc] init]];
    [self.outlineView reloadData];
}

- (IBAction)remove:(id)sender {
    Person *p = [self.outlineView itemAtRow:[self.outlineView selectedRow]];
    Person *parent = [self.outlineView parentForItem:p];
    if (parent)
        [parent removeChild:p];
    else if (p)
        [self.people removeObject:p];
    [self.outlineView reloadData];
}








@end

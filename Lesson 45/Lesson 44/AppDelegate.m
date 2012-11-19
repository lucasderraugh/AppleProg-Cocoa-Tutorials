//
//  AppDelegate.m
//  Lesson 44
//
//  Created by Lucas Derraugh on 11/16/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate {
    NSPredicate *_searchPredicate;
}

- (id)init {
    self = [super init];
    if (self) {
        _people = [[NSMutableArray alloc] init];
        _searchPredicate = [NSPredicate predicateWithFormat:@"(name contains[cd] $value) or (age == $value.intValue)"];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [_tableView setSortDescriptors:
     @[
      [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)],
      [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES]]];
}

- (IBAction)changePredicate:(id)sender {
    NSString *string = [sender stringValue];
    NSPredicate *predicate = nil;
    if (![string isEqualToString:@""]) {
        NSDictionary *dictionary = @{@"value" : string};
        predicate = [_searchPredicate predicateWithSubstitutionVariables:dictionary];
    }
    [_arrayController setFilterPredicate:predicate];
}










@end

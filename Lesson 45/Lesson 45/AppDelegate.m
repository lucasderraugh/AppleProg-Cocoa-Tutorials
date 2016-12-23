//
//  AppDelegate.m
//  Lesson 45
//
//  Created by Lucas Derraugh on 11/16/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property NSPredicate *searchPredicate;

@end

@implementation AppDelegate

- (instancetype)init {
    if (self = [super init]) {
        _people = [[NSMutableArray alloc] init];
        _searchPredicate = [NSPredicate predicateWithFormat:@"(name contains[cd] $value) or (age == $value.intValue)"];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSArray *descriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)],
                             [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES]];
    [self.tableView setSortDescriptors:descriptors];
}

- (IBAction)changePredicate:(NSSearchField *)sender {
    NSString *string = sender.stringValue;
    NSPredicate *predicate = nil;
    if (![string isEqualToString:@""]) {
        NSDictionary *dictionary = @{@"value" : string};
        predicate = [self.searchPredicate predicateWithSubstitutionVariables:dictionary];
    }
    self.arrayController.filterPredicate = predicate;
}










@end

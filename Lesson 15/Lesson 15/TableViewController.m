#import "TableViewController.h"
#import "Person.h"

@implementation TableViewController

- (id)init
{
    self = [super init];
    if (self) {
        list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [list count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Person *p = [list objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    return [p valueForKey:identifier];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Person *p = [list objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    [p setValue:object forKey:identifier];
}

- (IBAction)add:(id)sender {
    Person *person = [[Person alloc] init];
    [list addObject:person];
    [tableView reloadData];
    [person release];
}

- (IBAction)remove:(id)sender {
    NSInteger row = [tableView selectedRow];
    [tableView abortEditing];
    if (row != -1)
        [list removeObjectAtIndex:row];
    [tableView reloadData];
}

- (void)dealloc
{
    [list release];
    [super dealloc];
}

@end
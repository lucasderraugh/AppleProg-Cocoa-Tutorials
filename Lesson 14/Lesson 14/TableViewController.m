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

- (IBAction)add:(id)sender {
    Person *person = [[Person alloc] init];
    [list addObject:person];
    [tableView reloadData];
    [person release];
}

- (void)dealloc
{
    [list release];
    [super dealloc];
}

@end

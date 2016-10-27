#import "TableViewController.h"
#import "Person.h"


@interface TableViewController ()

@property (nonatomic) NSMutableArray *list;

@end


@implementation TableViewController

- (id)init
{
    if (self = [super init]) {
        _list = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.list.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    Person *p = self.list[row];
    NSString *identifier = tableColumn.identifier;
    return [p valueForKey:identifier];
}

- (IBAction)add:(id)sender {
    Person *person = [[Person alloc] init];
    [self.list addObject:person];
    [self.tableView reloadData];
}

@end

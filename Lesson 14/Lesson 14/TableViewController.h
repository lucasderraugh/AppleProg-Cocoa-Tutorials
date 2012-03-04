
#import <Foundation/Foundation.h>


@interface TableViewController : NSObject <NSTableViewDataSource> {
@private
    IBOutlet NSTableView *tableView;
    NSMutableArray *list;
}

- (IBAction)add:(id)sender;

@end

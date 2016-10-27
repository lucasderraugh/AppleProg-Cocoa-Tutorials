
#import <Cocoa/Cocoa.h>


@interface TableViewController : NSObject <NSTableViewDataSource>

@property (nonatomic, weak) IBOutlet NSTableView *tableView;

- (IBAction)add:(id)sender;
- (IBAction)remove:(id)sender;

@end

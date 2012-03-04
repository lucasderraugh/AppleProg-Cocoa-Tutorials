#import "AppController.h"


@implementation AppController

- (IBAction)add:(id)sender {
    [popUp addItemWithTitle:[textField stringValue]];
}

- (IBAction)update:(id)sender {
    [label setStringValue:[popUp titleOfSelectedItem]];
}

@end

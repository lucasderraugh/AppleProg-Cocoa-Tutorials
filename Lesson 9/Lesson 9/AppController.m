#import "AppController.h"


@implementation AppController

- (IBAction)add:(id)sender {
    [self.popUp addItemWithTitle:[self.textField stringValue]];
}

- (IBAction)update:(id)sender {
    [self.label setStringValue:[self.popUp titleOfSelectedItem]];
}

@end

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject

@property (nonatomic, weak) IBOutlet NSPopUpButton *popUp;
@property (nonatomic, weak) IBOutlet NSTextField *textField;
@property (nonatomic, weak) IBOutlet NSTextField *label;

- (IBAction)add:(id)sender;
- (IBAction)update:(id)sender;

@end

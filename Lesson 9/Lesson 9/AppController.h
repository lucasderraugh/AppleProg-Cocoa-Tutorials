#import <Foundation/Foundation.h>


@interface AppController : NSObject {
@private
    IBOutlet NSPopUpButton *popUp;
    IBOutlet NSTextField *textField;
    IBOutlet NSTextField *label;
}
- (IBAction)add:(id)sender;
- (IBAction)update:(id)sender;

@end

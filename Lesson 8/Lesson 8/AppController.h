#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
@private
    IBOutlet NSTextField *label;
    IBOutlet NSSlider *slider;
}
- (IBAction)sliderChange:(id)sender;

@end

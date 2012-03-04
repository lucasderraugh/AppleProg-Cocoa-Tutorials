#import "AppController.h"


@implementation AppController

- (void)awakeFromNib {
    [slider setIntValue:25];
    [label setIntValue:[slider intValue]];
}

- (IBAction)sliderChange:(id)sender {
    [label setIntValue:[slider intValue]];
}
@end

#import "OurView.h"


@implementation OurView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSRect rect = NSMakeRect(0, 0, 500, 400);
        imageView = [[NSImageView alloc] initWithFrame:rect];
        [imageView setImageScaling:NSScaleToFit];
        [imageView setImage:[NSImage imageNamed:@"image.jpg"]];
        [self addSubview:imageView];
    }
    return self;
}

- (void)dealloc
{
    [imageView release];
    [super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}

@end

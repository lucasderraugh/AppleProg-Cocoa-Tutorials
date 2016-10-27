
#import "Person.h"


@implementation Person

- (id)init
{
    if (self = [super init]) {
        _name = @"Yoda";
        _age = 300;
    }
    return self;
}

@end

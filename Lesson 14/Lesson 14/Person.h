
#import <Foundation/Foundation.h>


@interface Person : NSObject {
@private
    NSString *name;
    int age;
}

@property (copy) NSString *name;
@property int age;

@end

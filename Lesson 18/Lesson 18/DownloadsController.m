//
//  DownloadsController.m
//  Lesson 18
//
//  Created by Lucas Derraugh on 8/3/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "DownloadsController.h"


@implementation DownloadsController

- (IBAction)changeText:(id)sender {
    self.textField.stringValue = [NSString stringWithFormat:@"Num: %u", arc4random()%10+1];
}

@end

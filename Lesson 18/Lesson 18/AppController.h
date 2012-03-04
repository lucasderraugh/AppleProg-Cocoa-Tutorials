//
//  AppController.h
//  Lesson 18
//
//  Created by Lucas Derraugh on 8/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DownloadsController;

@interface AppController : NSObject {
@private
    DownloadsController *downloadsController;
}

- (IBAction)showDownloads:(id)sender;

@end

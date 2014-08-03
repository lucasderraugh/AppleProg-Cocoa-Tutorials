//
//  File.h
//  Lesson 60
//
//  Created by Lucas Derraugh on 7/19/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>

@interface File : NSObject <QLPreviewItem>

@property (nonatomic, strong) NSURL *fileURL;

@end

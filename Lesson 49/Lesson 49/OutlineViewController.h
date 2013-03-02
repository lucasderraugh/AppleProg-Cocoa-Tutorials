//
//  OutlineViewController.h
//  Lesson 49
//
//  Created by Lucas Derraugh on 2/23/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OutlineViewController : NSObject <NSOutlineViewDataSource>

@property (copy) NSMutableArray *people;

@end

//
//  AppDelegate.h
//  iTwunes
//
//  Created by Damodar Shenoy on 11/08/12.
//  Copyright (c) 2012 Open hack India 2012. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) NSMutableDictionary *dictionary;

- (IBAction)done:(id)sender;

@end

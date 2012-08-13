//
//  AppDelegate.m
//  iTwunes
//
//  Created by Damodar Shenoy on 11/08/12.
//  Copyright (c) 2012 Open hack India 2012. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize dictionary;

- (void)dealloc
{
    [dictionary release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    NSString *frPath = [[NSBundle mainBundle] pathForResource:@"qIT" ofType:@"scpt"];
    NSString *toPath = [@"~/Library/iTunes/Scripts/qIT.scpt" stringByExpandingTildeInPath];
	
    NSString *frPath2 = [[NSBundle mainBundle] pathForResource:@"twiTunes" ofType:@"scpt"];
    NSString *toPath2 = [@"~/Library/iTunes/Scripts/twiTunes.scpt" stringByExpandingTildeInPath];
	
    NSString *frPath3 = [[NSBundle mainBundle] pathForResource:@"youTune" ofType:@"scpt"];
    NSString *toPath3 = [@"~/Library/iTunes/Scripts/youTune.scpt" stringByExpandingTildeInPath];
	
    
    NSString *path = [@"~/Library/Preferences/com.apple.iTunes.plist" stringByExpandingTildeInPath];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:toPath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:[toPath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    [[NSFileManager defaultManager] copyItemAtPath:frPath toPath:toPath error:NULL];
    [[NSFileManager defaultManager] copyItemAtPath:frPath2 toPath:toPath2 error:NULL];
    [[NSFileManager defaultManager] copyItemAtPath:frPath3 toPath:toPath3 error:NULL];
	
    
    self.dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
	
    if([dictionary valueForKey:@"NSUserKeyEquivalents"] != nil) {
        [[dictionary objectForKey:@"NSUserKeyEquivalents"] setObject:@"^q" forKey:@"qIT"];
        [[dictionary objectForKey:@"NSUserKeyEquivalents"] setObject:@"^t" forKey:@"twiTunes"];
        [[dictionary objectForKey:@"NSUserKeyEquivalents"] setObject:@"^y" forKey:@"youTune"];
        [dictionary writeToFile:path atomically:FALSE ];
    }
    else
    {
        NSMutableDictionary *enq = [NSMutableDictionary dictionary];
        [enq setObject:@"^q" forKey:@"qIT"];
        [enq setObject:@"^t" forKey:@"twiTunes"];
        [enq setObject:@"^y" forKey:@"youTune"];
        
        [dictionary setObject:enq forKey:@"NSUserKeyEquivalents"];
        
        [dictionary writeToFile:path atomically:FALSE ];
    }
}

- (IBAction)done:(id)sender
{
    [_window close];
    
    exit(0);
    
}

@end

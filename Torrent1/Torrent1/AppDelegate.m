//
//  AppDelegate.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
	NSArray* urls = [[NSDocumentController sharedDocumentController] recentDocumentURLs];
	if ([urls count] > 0){
		NSURL *lastURL= [urls objectAtIndex: 0];
		
		[[NSDocumentController sharedDocumentController] openDocumentWithContentsOfURL:lastURL display:YES completionHandler:^(NSDocument * __nullable document, BOOL documentWasAlreadyOpen, NSError * __nullable error) {}];
	}
	else
	{
		[[NSDocumentController sharedDocumentController] openDocument:nil];
	}
	return NO;
}


@end

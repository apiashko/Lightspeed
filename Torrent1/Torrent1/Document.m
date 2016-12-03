//
//  Document.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

NSString* _Title;

- (instancetype)init {
    self = [super init];
    if (self) {
			_Title = @"No File";
    }
    return self;
}

+ (BOOL)autosavesInPlace {
	return YES;
}


- (NSString *)windowNibName {

	return @"Document";
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {

	return nil;
}


- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
	
	NSInputStream* stream = [NSInputStream inputStreamWithData:data];
	[stream open];
	_torrentTree = [[FileTree alloc] init:stream];
	[stream close];
	return YES;
}


@end

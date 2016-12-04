//
//  FileTree.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "FileTree.h"
#import "Factory.h"
#import "String.h"
#import "Integer.h"

@implementation FileTree

-(FileTree *)init:(NSInputStream*) stream
{
	self = [super init];
	_root = [Factory create:stream];
	return self;
}

-(NSString *)getTitle
{
	NSString* ret = @"not found";
	Element *el = [_root find:@"name"];
	if(el && [el isKindOfClass:[String class]])
	{
		String * str = (String *)el;
		ret = str.data;
	}
	return ret;
}

-(void)fixDateFormat
{
	Element *el = [_root find:@"creation date"];
	if(el && [el isKindOfClass:[Integer class]])
	{
		Integer * val = (Integer *)el;
		val.dateFormat = YES;
	}
}

@end

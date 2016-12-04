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

-(NSString *)getTracker
{
	NSString* ret = @"not found";
	Element *el = [_root find:@"announce"];
	if(el && [el isKindOfClass:[String class]])
	{
		String * str = (String *)el;
		ret = str.data;
	}
	return ret;
}

-(NSString *)getDate
{
	NSString* ret = @"not found";
	Element *el = [_root find:@"creation date"];
	if(el && [el isKindOfClass:[Integer class]])
	{
		Integer * val = (Integer *)el;
		NSDate* date = [NSDate dateWithTimeIntervalSince1970:val.data];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		formatter.dateStyle = kCFDateFormatterFullStyle;
		ret = [formatter stringFromDate:date];
	}
	return ret;
}

-(NSString *)getCreator
{
	NSString* ret = @"not found";
	Element *el = [_root find:@"created by"];
	if(el && [el isKindOfClass:[String class]])
	{
		String * str = (String *)el;
		ret = str.data;
	}
	return ret;
}

@end

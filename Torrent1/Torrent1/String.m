//
//  String.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "String.h"

@implementation String

- (id)copyWithZone:(NSZone *)zone
{
	String* ret = [[String alloc] init];
	ret.data = [_data copyWithZone:zone];
	return ret;
}

-(String*) init:(NSInputStream*)stream length:(NSInteger)toProcess
{
	self = [super init];
	_rawData = nil;
	NSMutableData* temp = [[NSMutableData alloc] initWithCapacity:toProcess];
	[temp resetBytesInRange:NSMakeRange(0, toProcess)];
	if ( [stream read:[temp mutableBytes] maxLength:toProcess] == toProcess)
	{
		_data = [[NSString alloc] initWithData:temp encoding:NSUTF8StringEncoding];
		if(_data == nil)
		{
			// not UTF-8 encoding, save the data itself
			_rawData = temp;
		}
	}
	else
	{
		//NSLog(@"error reading string data from streeam");
	}
	return self;
}

- (NSString*)label
{
	return _data;
}

@end

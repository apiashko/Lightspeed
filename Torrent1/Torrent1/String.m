//
//  String.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "String.h"
//#include <vector>

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
	NSMutableData* temp = [[NSMutableData alloc] initWithCapacity:toProcess];
	[temp resetBytesInRange:NSMakeRange(0, toProcess)];
	if ( [stream read:[temp mutableBytes] maxLength:toProcess] == toProcess)
	{
		_data = [[NSString alloc] initWithData:temp encoding:NSUTF8StringEncoding];
	}
	return self;
}

@end

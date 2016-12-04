//
//  Sha1.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-04.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Sha1.h"

@implementation Sha1

- (id)copyWithZone:(NSZone *)zone
{
	Sha1* ret = [[Sha1 alloc] init];
	ret.data = [_data copyWithZone:zone];
	return ret;
}

-(Sha1*) init:(NSInputStream*)stream
{
	self = [super init];
	uint8_t bytes[20];
	if ( [stream read:bytes maxLength:sizeof(bytes)] == sizeof(bytes))
	{
		_data = @"";
		for (int i = 0; i < sizeof(bytes); i++)
		{
			_data = [_data stringByAppendingFormat:@"%.2x", bytes[i]];
		}
	}

	return self;
}

- (NSString*)label
{
	return _data;
}


@end

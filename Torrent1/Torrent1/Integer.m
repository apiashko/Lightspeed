//
//  Integer.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Integer.h"

@implementation Integer

- (id)copyWithZone:(NSZone *)zone
{
	Integer* ret = [[Integer alloc] init];
	ret.data = _data;
	return ret;
}

-(Integer*) init:(NSInputStream*) stream
{
	self = [super init];
	_dateFormat = NO;
	// max for int is 4294967295 - 10 characters, one for 'e' terminator, one just in case
	uint8_t bytes[12] = {};
	NSInteger read = 0;
	BOOL ok = [stream hasBytesAvailable];
	do{
		ok = ([stream read:(bytes+read) maxLength:1] == 1);
	}while(ok && isnumber(bytes[read++]) && read < sizeof(bytes));
	if(ok)
	{
		NSInteger last = read-1;
		if(bytes[last] == 'e')
		{
			// properly terminated
			NSString* val = [[NSString alloc] initWithBytes:bytes length:last encoding:NSUTF8StringEncoding];
			_data = [val integerValue];
		}
	}
	return self;
}

- (NSString*)label
{
	if(self.dateFormat)
	{
		NSDate* date = [NSDate dateWithTimeIntervalSince1970:self.data];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		formatter.dateStyle = kCFDateFormatterFullStyle;
		return [formatter stringFromDate:date];
	}
	else
	{
		return [NSString stringWithFormat:@"%d", (int)(self.data)];
	}
}

@end

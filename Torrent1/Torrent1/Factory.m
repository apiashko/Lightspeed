//
//  Factory.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Factory.h"
#import "Integer.h"
#import "Dictionary.h"
#import "List.h"
#import "String.h"

@implementation Factory

+(Element*) create:(NSInputStream*) stream
{
	Element* result = nil;
	
	// max for int is 4294967295 - 10 characters, one for :, one just in case
	uint8_t bytes[12] = {};
	NSInteger read = 0;
	BOOL ok = [stream hasBytesAvailable];
	do{
		
		ok = ([stream read:(bytes+read) maxLength:1] == 1);
	}while(ok && isnumber(bytes[read++]) && read < sizeof(bytes));
	if(ok)
	{
		NSInteger last = read-1;
		switch(bytes[0])
		{
				case 'e':
				result = [Element terminator];
				break;
				case 'i':
					result = [[Integer alloc] init:stream];
				break;
				case 'l':
					result = [[List alloc] init:stream];
				break;
				case 'd':
					result = [[Dictionary alloc] init:stream];
				break;
			default:
				if(isnumber(bytes[0]) && bytes[last] == ':')
				{
					NSString* num = [[NSString alloc] initWithBytes:bytes length:last encoding:NSUTF8StringEncoding];
					NSInteger toProcess = [num intValue];
					result = [[String alloc] init:stream length:toProcess];
				}
				break;
		}
	}
	return result;
}

@end

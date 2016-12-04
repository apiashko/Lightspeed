//
//  Dictionary.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Dictionary.h"
#import "Factory.h"
#import "String.h"
#import "List.h"

@implementation Dictionary

- (id)copyWithZone:(NSZone *)zone
{
	Dictionary* ret = [[Dictionary alloc] init];
	ret.data = [_data copyWithZone:zone];
	return ret;
}

-(Dictionary*) init:(NSInputStream*) stream
{
	self = [super init];
	_data = [[NSMutableDictionary alloc] init];
	do
	{
		Element* key = [Factory create:stream];
		if(key == [Element terminator] || key == nil)
		{
			break;
		}
		//clamp size 1 lists
		Element* obj = [Factory create:stream];
		if ([obj isKindOfClass:[List class]])
		{
			List *lst = (List *)obj;
			if([lst.data count] == 1)
			{
				obj = (Element *)[lst.data objectAtIndex:0];
			}
		}
		// labels
		obj.labelSource = key;
		[_data setObject:obj forKey:key];
	}while(true);
	return self;
}

- (Element *)find:(NSString *)name
{
	Element * ret = nil;
	
	NSEnumerator *enumerator = [_data keyEnumerator];
	id key = nil;
	while ( (key = [enumerator nextObject]) != nil)
	{
		id obj = [_data objectForKey:key];
		if ([obj isKindOfClass:[Element class]])
		{
			Element *next = (Element *)obj;
			if ([key isKindOfClass:[String class]])
			{
				String *str = (String *)key;
				if([str.data isEqualToString:name])
				{
					ret = (Element *)next;
				}
				else
				{
					ret = [next find:name];
				}
				if(ret != nil)
				{
					break;
				}
			}
		}
	}

	return ret;
}

- (NSString*)label
{
	return [NSString stringWithFormat:@"(%d items)", (int)([_data count])];
}

@end

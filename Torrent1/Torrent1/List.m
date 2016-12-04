//
//  List.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "List.h"
#import "Factory.h"

@implementation List

- (id)copyWithZone:(NSZone *)zone
{
	List* ret = [[List alloc] init];
	ret.data = [_data copyWithZone:zone];
	return ret;
}

-(List*) init:(NSInputStream*) stream
{
	self = [super init];
	_data = [[NSMutableArray alloc] init];
	do
	{
		Element* obj = [Factory create:stream];
		if(obj == [Element terminator] || obj == nil)
		{
			break;
		}
		//clamp size 1 lists
		if ([obj isKindOfClass:[List class]])
		{
			List *lst = (List *)obj;
			if([lst.data count] == 1)
			{
				obj = (Element *)[lst.data objectAtIndex:0];
			}
		}
		[_data addObject:obj];
	}while(true);
	return self;
}

- (Element *)find:(NSString *)name
{
	Element * ret = nil;
	for(id item in _data)
	{
		if ([item isKindOfClass:[Element class]])
		{
			Element * el = (Element *)item;
			ret = [el find:name];
			if(ret != nil)
			{
				break;
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

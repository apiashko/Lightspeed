//
//  Dictionary.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Dictionary.h"
#import "Factory.h"

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
		Element* obj = [Factory create:stream];
		[_data setObject:obj forKey:key];
	}while(true);
	return self;
}

@end

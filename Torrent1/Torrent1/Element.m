//
//  Element.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Element.h"

@implementation Element

-(nonnull id) init
{
	self = [super init];
	_labelSource = (Element *)self;
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	return [[Element alloc] init];
}

- (Element *)find:(NSString *)name
{
	return nil;
}

+ (Element *)terminator
{
	static Element* el = nil;
	if(el == nil)
	{
		el = [[Element alloc] init];
	}
	return el;
}

- (NSString*)stringValue
{
	NSString* ret = [_labelSource label];
	if(_labelSource == self)
	{
		return [self label];
	}
	else
	{
		return  [NSString stringWithFormat:@"%@: %@", [_labelSource label], [self label]];
	}
	return ret;
}

- (NSString*)label
{
	return @"";
}

@end

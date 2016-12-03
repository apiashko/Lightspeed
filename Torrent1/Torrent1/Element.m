//
//  Element.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Element.h"

@implementation Element

+ (Element *)terminator
{
	static Element* el = nil;
	if(el == nil)
	{
		el = [[Element alloc] init];
	}
	return el;
}
@end

//
//  FileTree.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "FileTree.h"
#import "Factory.h"

@implementation FileTree

-(FileTree*) init:(NSInputStream*) stream
{
	self = [super init];
	_root = [Factory create:stream];
	return self;
}

@end

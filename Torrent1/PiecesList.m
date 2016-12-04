//
//  PiecesList.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-04.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "PiecesList.h"
#import "Sha1.h"

@implementation PiecesList

- (PiecesList *)init
{
	self = [super init];
	super.data = [[NSMutableArray alloc] init];
	return self;
}

- (void)add:(Element *)el
{
	[super.data addObject:el];
}

- (void)label:(Element *)el
{
	super.labelSource = el;
}


@end

//
//  Document.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Document.h"
#import "String.h"
#import "Integer.h"
#import "List.h"
#import "Dictionary.h"

@interface Document ()

@end

@implementation Document

NSString* _Title;

- (instancetype)init {
    self = [super init];
    if (self) {
			_Title = @"No File";
    }
    return self;
}

+ (BOOL)autosavesInPlace {
	return YES;
}


- (NSString *)windowNibName {

	return @"Document";
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {

	return nil;
}


- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
	
	NSInputStream* stream = [NSInputStream inputStreamWithData:data];
	[stream open];
	_torrentTree = [[FileTree alloc] init:stream];
	[stream close];
	
	// title
	[self setDisplayName:[_torrentTree getTitle]];
	
	// post parsing processing
	[_torrentTree fixDateFormat];
	[_torrentTree mapPieces];

	return YES;
}

- (NSInteger)outlineView:(NSOutlineView *__nonnull)outlineView numberOfChildrenOfItem:(nullable id)item
{
	if(item == nil)
	{
		item = _torrentTree.root;
	}
	
	NSInteger ret = 0;
	if([item isKindOfClass:[Dictionary class]])
	{
		Dictionary * dict = (Dictionary *)item;
		ret = [dict.data count];
	}
	if([item isKindOfClass:[List class]])
	{
		List * lst = (List *)item;
		ret = [lst.data count];
	}
	return ret;
}

- (id)outlineView:(NSOutlineView *__nonnull)outlineView child:(NSInteger)index ofItem:(nullable id)item
{
	if(item == nil)
	{
		item = _torrentTree.root;
	}
	
	if([item isKindOfClass:[Dictionary class]])
	{
		Dictionary * dict = (Dictionary *)item;
		NSArray<id> * keys = [dict.data allKeys];
		if(index < [keys count])
		{
			Element *key = (Element *)[keys objectAtIndex:index];
#if 0
			// this just misfires time to time, figure out if you have time left
			Element *obj = [dict.data objectForKey:key];
#else
			static Element *obj = nil;
			obj = nil;
			[dict.data enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:
				^(id aKey, id anObject, BOOL *stop)
				{
					if(key == aKey)
					{
						obj = (Element *)anObject;
						*stop = YES;
					}
				}];
#endif
			return obj;
		}
	}
	if([item isKindOfClass:[List class]])
	{
		List * lst = (List *)item;
		if(index < [lst.data count])
		{
			return [lst.data objectAtIndex:index];
		}
	}
	
	return item;
}

- (BOOL)outlineView:(NSOutlineView *__nonnull)outlineView isItemExpandable:(nullable id)item
{
	if(item == nil)
	{
		item = _torrentTree.root;
	}
	
	return [item isKindOfClass:[Dictionary class]] || [item isKindOfClass:[List class]];
}

- (void)outlineView:(nonnull NSOutlineView *)outlineView willDisplayCell:(id)cell forTableColumn:(nullable NSTableColumn *)tableColumn item:(nonnull id)item
{
	if([cell isKindOfClass:[NSCell class]] && [item isKindOfClass:[Element class]])
	{
		NSCell *aCell = (NSCell *)cell;
		Element *anItem = (Element *)item;
		aCell.stringValue = [anItem stringValue];
	}
}

@end

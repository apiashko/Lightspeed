//
//  FileTree.m
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "FileTree.h"
#import "Factory.h"
#import "String.h"
#import "Integer.h"
#import "List.h"
#import "Dictionary.h"
#import "Sha1.h"
#import "PiecesList.h"

@implementation FileTree

-(FileTree *)init:(NSInputStream*) stream
{
	self = [super init];
	_root = [Factory create:stream];
	return self;
}

-(NSString *)getTitle
{
	NSString* ret = @"not found";
	Element *el = [_root find:@"name"];
	if(el && [el isKindOfClass:[String class]])
	{
		String * str = (String *)el;
		ret = str.data;
	}
	return ret;
}

-(void)fixDateFormat
{
	Element *el = [_root find:@"creation date"];
	if(el && [el isKindOfClass:[Integer class]])
	{
		Integer * val = (Integer *)el;
		val.dateFormat = YES;
	}
}

- (void)mapPieces
{
	// only if pieces are in binary format
	Element *piecesEntry = [_root find:@"pieces"];
	if(piecesEntry && [piecesEntry isKindOfClass:[String class]])
	{
		String *str = (String *)piecesEntry;
		NSData* data = str.rawData;
		if(data != nil)
		{
			Element *pl = [_root find:@"piece length"];
			if(pl && [pl isKindOfClass:[Integer class]])
			{
				NSInteger size = ((Integer *)pl).data;
				Element *fs = [_root find:@"files"];
				if(fs && [fs isKindOfClass:[List class]])
				{
					NSInputStream* stream = [NSInputStream inputStreamWithData:data];
					[stream open];
					
					List * lst = (List *)fs;
					NSInteger curOffset = 0;
					NSRange pieceRange = NSMakeRange(0, size);
					Sha1 *piece = [[Sha1 alloc] init:stream];
					for(Dictionary *file in lst.data)
					{
						Element *elLength = [file find:@"length"];
						PiecesList *plist = [[PiecesList alloc]init];
						if([elLength isKindOfClass:[Integer class]])
						{
							NSInteger len = ((Integer*)elLength).data;
							
							// need all files in pieces and all pieces in files
							// interesting.....
							
							// check if start of the file in the piece
							while(curOffset < pieceRange.location + pieceRange.length)
							{
								[plist add:piece];
							
								// if end of the file outside of piece
								if(curOffset + len > pieceRange.location + pieceRange.length)
								{
									// we need 1 more piece
									if([stream hasBytesAvailable])
									{
										piece = [[Sha1 alloc] init:stream];
									}
									// move with previous piece if no more data available
									pieceRange = NSMakeRange(pieceRange.location + size, size);
								}
								else
								{
									break; // we need 1 more file
								}
							}

							// next file offset
							curOffset += len;
							
							// add to dictionary
							String* label = [[String alloc] init:@"Sha1"];
							[plist label:label];
							[file.data setObject:plist forKey:label];
						}
					}
					[stream close];
				}
			}
		}
	}
}

@end

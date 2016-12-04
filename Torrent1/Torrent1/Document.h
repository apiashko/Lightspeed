//
//  Document.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppKit/NSOutlineView.h>
#import "FileTree.h"

@interface Document : NSDocument<NSOutlineViewDataSource>

@property FileTree *__nonnull torrentTree;

- (NSInteger)outlineView:(NSOutlineView *__nonnull)outlineView numberOfChildrenOfItem:(nullable id)item;
- (nonnull id)outlineView:(NSOutlineView *__nonnull)outlineView child:(NSInteger)index ofItem:(nullable id)item;
- (BOOL)outlineView:(NSOutlineView *__nonnull)outlineView isItemExpandable:(nullable id)item;

@end


//
//  Document.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FileTree.h"

@interface Document : NSDocument

@property FileTree* torrentTree;
@end


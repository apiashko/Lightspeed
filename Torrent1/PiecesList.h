//
//  PiecesList.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-04.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "List.h"

@interface PiecesList : List

- (PiecesList *)init;

- (void)add:(Element *)el;
- (void)label:(Element *)el;

@end

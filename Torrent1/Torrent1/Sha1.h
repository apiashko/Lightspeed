//
//  Sha1.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-04.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import "Element.h"

@interface Sha1 : Element
@property NSString* data;

- (id)copyWithZone:(NSZone *)zone;
- (Sha1 *)init:(NSInputStream *)stream;

- (NSString*)label;
@end

//
//  Dictionary.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"

@interface Dictionary : Element
@property NSMutableDictionary* data;

- (id)copyWithZone:(NSZone *)zone;
- (Dictionary *)init:(NSInputStream *)stream;
- (Element *)find:(NSString *)name;

- (NSString*)label;
@end

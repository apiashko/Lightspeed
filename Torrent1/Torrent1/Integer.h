//
//  Integer.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"

@interface Integer : Element
@property NSInteger data;

- (id)copyWithZone:(NSZone *)zone;
- (Integer*)init:(NSInputStream *)stream;

@end

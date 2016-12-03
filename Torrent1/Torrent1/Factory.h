//
//  Factory.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"

@interface Factory : NSObject

+(Element*) create:(NSInputStream*) stream;

@end

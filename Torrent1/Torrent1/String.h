//
//  String.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"

@interface String : Element

@property NSString* data;

- (id)copyWithZone:(NSZone *)zone;
-(String*) init:(NSInputStream*)stream length:(NSInteger)toProcess;

@end

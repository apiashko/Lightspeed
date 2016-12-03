//
//  Element.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Element : NSObject<NSCopying>
+ (Element *)terminator;

- (id)copyWithZone:(NSZone *)zone;
@end



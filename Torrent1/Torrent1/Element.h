//
//  Element.h
//  Torrent1
//
//  Created by Alex Piashko on 2016-12-03.
//  Copyright © 2016 Alex Piashko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Element;

@interface Element : NSObject<NSCopying>
@property Element * labelSource;
- (nonnull id)init;
- (id)copyWithZone:(NSZone *)zone;
- (Element *)find:(NSString *)name;

- (NSString*)stringValue;
- (NSString*)label;

+ (Element *)terminator;
@end



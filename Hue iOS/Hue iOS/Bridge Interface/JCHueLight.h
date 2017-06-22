//
//  JCHueLight.h
//  Hue iOS
//
//  Created by James Cervone on 5/24/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCHueLight : NSObject

// GET
+ (NSArray *)allLights;
+ (NSArray *)fetchNewLights;
+ (JCHueLight *)lightWithIdentifier:(NSUInteger)identifier;

// PUT
- (void)setAttributesWithDict:(NSDictionary *)dict;
- (void)setStateWithDict:(NSDictionary *)dict;

// POST
+ (void)searchNewLights;

// DELETE
+ (void)deleteLight:(JCHueLight *)light;

@end

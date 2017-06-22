//
//  JCHueGroup.h
//  Hue iOS
//
//  Created by James Cervone on 5/25/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCHueGroup : NSObject

// GET
- (NSArray *)allGroups;
- (JCHueGroup *)groupWithIdentifier:(NSInteger)identifier;

// PUT
- (void)setAttributesWithDict:(NSDictionary *)dict;
- (void)setActionWithDict:(NSDictionary *)dict;

// POST
+ (void)CreateGroup;

// DELETE
+ (void)deleteGroup:(JCHueGroup *)group;

@end

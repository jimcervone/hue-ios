//
//  JCHueSchedule.h
//  Hue iOS
//
//  Created by James Cervone on 5/25/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCHueSchedule : NSObject

// GET
+ (NSArray *)allSchedules;
+ (JCHueSchedule *)scheduleWithIdentifier:(NSInteger)identifier;

// PUT
- (void)setAttributesWithDict:(NSDictionary *)dict;

// POST
+ (void)createSchedule;

// DELETE
+ (void)deleteSchedule:(JCHueSchedule *)schedule;

@end

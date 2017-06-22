//
//  JCJsonMgr.m
//  Hue iOS
//
//  Created by James Cervone on 5/19/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import "JCJsonMgr.h"

@implementation JCJsonMgr

+ (NSData *)jsonDataFromDict:(NSDictionary *)dict {
    NSError *error = nil;
    return [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
}

@end

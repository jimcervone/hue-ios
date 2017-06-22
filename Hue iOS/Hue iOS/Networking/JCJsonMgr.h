//
//  JCJsonMgr.h
//  Hue iOS
//
//  Created by James Cervone on 5/19/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCJsonMgr : NSObject

+ (NSData *)jsonDataFromDict:(NSDictionary *)dict;

@end

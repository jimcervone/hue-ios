//
//  RPURLMgr.h
//  RPCodeTest
//
//  Created by James Cervone on 5/7/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import <Foundation/Foundation.h>

// GET
extern NSString * const kUserEndpointLights;
extern NSString * const kUserEndpointLight2;

// PUT
extern NSString * const kUserEndpointLightState; // {"on":false}

// This is another example of a Manager. The RPURLManager is responsible for constructing our endpoint URLs so that
// we can utilize string constants at runtime and aren't dropping in URL strings throughout the codebase.
@interface RPURLMgr : NSObject

+ (NSURL *)urlWithEndpoint:(NSString *)endpoint;
+ (NSURL *)urlWithUserEndpoint:(NSString *)endpoint;

@end

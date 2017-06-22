//
//  RPURLMgr.m
//  RPCodeTest
//
//  Created by James Cervone on 5/7/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import "RPURLMgr.h"

// URL Components
NSString * const kScheme = @"http";
NSString * const kHost = @"192.168.1.154";
NSString * const kPort = @"80";

NSString * const kUser = @"nEMbC79-4mLUJLCi2nedSroKZoTVcSogaK4ydkhP";

// Endpoints

// GET
NSString * const kEndpointClip              = @"api/debug/clip";

NSString * const kUserEndpointLights        = @"api/%@/lights";
NSString * const kUserEndpointNewLights     = @"api/%@/lights/new";
NSString * const kUserEndpointLightAttr     = @"api/%@/lights/%@";

NSString * const kUserEndpointLight2Attr    = @"api/%@/lights/2";

NSString * const kUserEndpointGroups        = @"api/%@/groups";
NSString * const kUserEndpointGroupAttr     = @"api/%@/groups/%@";

NSString * const kUserEndpointGroup0Attr    = @"api/%@/groups/0";

NSString * const kUserEndpointSchedules     = @"api/%@/schedules";
NSString * const kUserEndpointScheduleAttr  = @"api/%@/schedules/%@";

NSString * const kUserEndpointScenes        = @"api/%@/scenes";
NSString * const kUserEndpointScene         = @"api/%@/scenes/%@";

NSString * const kUserEndpointSensors       = @"api/%@/sensors";
NSString * const kUserEndpointNewSensors    = @"api/%@/sensors/new";
NSString * const kUserEndpointSensor        = @"api/%@/sensors/%@";

NSString * const kUserEndpointRules         = @"api/%@/rules";
NSString * const kUserEndpointRule          = @"api/%@/rules/%@";

NSString * const kUserEndpointConfig        = @"api/%@/config";
NSString * const kUserEndpointFullState     = @"api/%@";

NSString * const kUserEndpointResourcelinks = @"api/%@/resourcelinks";
NSString * const kUserEndpointResourcelink  = @"api/%@/resourcelinks/%@";

NSString * const kUserEndpointCapabilities  = @"api/%@/capabilities";
// Capability allows the user to list capabilities of resources supported in the bridge.
// api/<username>/capabilities/<resource>/<subresource>
// api/<username>/capabilities/<resource>/<resourcetype>
// api/<username>/capabilities/lights
// api/<username>/capabilities/sensors
// api/<username>/capabilities/groups
// api/<username>/capabilities/scenes
// api/<username>/capabilities/schedules
// api/<username>/capabilities/rules
// api/<username>/capabilities/timezones

// PUT
NSString * const kUserEndpointSetLightAttr      = @"api/%@/lights/%@";
NSString * const kUserEndpointSetLightState     = @"api/%@/lights/%@/state";

NSString * const kUserEndpointGroupAction       = @"api/%@/groups/%@/action";
NSString * const kUserEndpointSetGroupAttr      = @"api/%@/groups/%@";

//NSString * const kUserEndpointSetLight2Attr = @"api/%@/lights/2"; // {"name":"bedroom light"}
//NSString * const kUserEndpointSetLight2State= @"api/%@/lights/2/state"; // {"on":false}
//
//NSString * const kUserEndpointGroup0Action  = @"api/%@/groups/0/action";
//NSString * const kUserEndpointSetGroup0Attr = @"api/%@/groups/0"; // {"name":"bedroom","lights":["1"]}

NSString * const kUserEndpointSetScheduleAttr   = @"api/%@/schedules/%@";

NSString * const kUserEndpointModifyScene       = @"api/%@/scenes/%@/lightstates/%@"; // 1.11 or higher
NSString * const kUserEndpointModifySceneAttr   = @"api/%@/scenes/%@";

NSString * const kUserEndpointCreateSceneLegacy = @"api/%@/scenes/%@"; // 1.10 or lower
NSString * const kUserEndpointModifySceneLegacy = @"api/%@/scenes/%@/lights/%@/state"; // 1.10 or lower

NSString * const kUserEndpointUpdateSensor      = @"api/%@/sensors/%@";
NSString * const kUserEndpointConfigSensor      = @"api/%@/sensors/%@/config";
NSString * const kUserEndpointSetSensorState    = @"api/%@/sensors/%@/state";

NSString * const kUserEndpointUpdateRule        = @"api/%@/rules/%@";

NSString * const kUserEndpointModifyConfig      = @"api/%@/config";

// POST
NSString * const kUserEndpointSearchNewLights   = @"api/%@/lights";

NSString * const kUserEndpointCreateGroup       = @"api/%@/groups";

NSString * const kUserEndpointCreateSchedule    = @"api/%@/schedules";

NSString * const kUserEndpointCreateScene       = @"api/%@/scenes"; // 1.11 or higher

NSString * const kUserEndpointCreateSensor      = @"api/%@/sensors";
NSString * const kUserEndpointSearchNewSensors  = @"api/%@/sensors";

NSString * const kUserEndpointCreateRule        = @"api/%@/rules";

NSString * const kUserEndpointCreateUser        = @"api";

NSString * const kUserEndpointCreateResourcelink= @"api/%@/resourcelinks";
NSString * const kUserEndpointUpdateResourcelink= @"api/%@/resourcelinks/%@";

// DELETE
NSString * const kUserEndpointDeleteLight       = @"api/%@/lights/%@";
NSString * const kUserEndpointDeleteGroup       = @"api/%@/groups/%@";
NSString * const kUserEndpointDeleteSchedule    = @"api/%@/schedules/%@";
NSString * const kUserEndpointDeleteScene       = @"api/%@/scenes/%@";
NSString * const kUserEndpointDeleteSensor      = @"api/%@/sensors/%@";
NSString * const kUserEndpointDeleteRule        = @"api/%@/rules/%@";
NSString * const kUserEndpointDeleteUser        = @"api/%@/config/whitelist/%@";
NSString * const kUserEndpointDeleteResourcelink= @"api/%@/resourcelinks/%@";

// As from 1.3 CLIP sensors can be deleted and as from 1.7 all other sensors (e.g. Tap)
// can be deleted also. Please see the delete devices application guidance page for more information.

@implementation RPURLMgr

//+ (NSURL *)urlWithUserEndpoint:(NSString *)endpoint index:(NSInteger)index {
//
//}

+ (NSURL *)urlWithUserEndpoint:(NSString *)endpoint {
    return [self urlWithEndpoint:endpoint user:kUser];
}

+ (NSURL *)urlWithEndpoint:(NSString *)endpoint {
    return [self urlWithEndpoint:endpoint user:nil];
}

+ (NSURL *)urlWithEndpoint:(NSString *)endpoint user:(NSString *)user {
    if (user != nil) {// && [endpoint containsString:@"%%@"]) {
        endpoint = [NSString stringWithFormat:endpoint, kUser];
    }

    NSString *urlString = [NSString stringWithFormat:@"%@://%@:%@/%@", kScheme, kHost, kPort, endpoint];
    return [NSURL URLWithString:urlString];
}

@end

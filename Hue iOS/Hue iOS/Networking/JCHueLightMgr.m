//
//  JCHueLightMgr.m
//  Hue iOS
//
//  Created by James Cervone on 5/19/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import "JCHueLightMgr.h"

#import "JCJsonMgr.h"
#import "RPURLMgr.h"

typedef NS_ENUM(NSInteger, ReqStatus) {
    ReqSuccess = 0,
    ReqFailure
};

/*
 HUE VALUES
 red: 0
 yellow: 12750
 green: 25500
 blue: 46920
 purple: 56100
 red: 65280
*/

@implementation JCHueLightMgr

+ (void)setColorLoop {
    NSDictionary *dict = @{ @"effect": @"colorloop" };
//    NSDictionary *dict = @{ @"effect": @"none" };
    NSURL *url = [RPURLMgr urlWithUserEndpoint:kUserEndpointLightState];
    [self requestWithURL:url requestBody:dict callback:nil];
}

+ (void)setLightOff {
    NSDictionary *dict = @{ @"on": @NO };
    NSURL *url = [RPURLMgr urlWithUserEndpoint:kUserEndpointLightState];
    [self requestWithURL:url requestBody:dict callback:nil];
}

+ (void)setLightRed {
    NSDictionary *dict = @{ @"on": @YES,
                            @"sat": @(254),
                            @"bri": @(254),
                            @"hue": @(1000) };

    NSURL *url = [RPURLMgr urlWithUserEndpoint:kUserEndpointLightState];
    [self requestWithURL:url requestBody:dict callback:^(ReqStatus status) {
        
    }];
}

+ (void)setLightOrange {
//    NSDictionary *dict = @{@"on": @NO};
//    NSDictionary *dict = @{@"on": @YES};

    NSDictionary *dict = @{ @"on": @YES,
                            @"sat": @(254),
                            @"bri": @(254),
                            @"hue": @(10000) };

    NSURL *url = [RPURLMgr urlWithUserEndpoint:kUserEndpointLightState];
    [self requestWithURL:url requestBody:dict callback:^(ReqStatus status) {

    }];
}

+ (void)requestWithURL:(NSURL *)url requestBody:(NSDictionary *)dict callback:(void (^)(ReqStatus))callback {
    NSData *data = [JCJsonMgr jsonDataFromDict:dict];

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:nil];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"PUT"];
    [request setHTTPBody:data];

    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpRes = (NSHTTPURLResponse *)response;

        if (httpRes.statusCode == 200) {
            if (callback != nil) {
                callback(ReqSuccess);
            }
        } else {
            if (callback != nil) {
                callback(ReqFailure);
            }
        }
    }];

    [task resume];
}


@end

//
//  ViewController.m
//  Hue iOS
//
//  Created by James Cervone on 5/19/17.
//  Copyright © 2017 Jim Cervone. All rights reserved.
//

#import "ViewController.h"

#import "JCHueLightMgr.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressRed:(id)sender {
    [JCHueLightMgr setLightRed];
}

- (IBAction)pressOff:(id)sender {
    [JCHueLightMgr setLightOff];
}

- (IBAction)colorLoop:(id)sender {
    [JCHueLightMgr setColorLoop];
}

- (IBAction)dance:(id)sender {
    double sum = 0;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self wholeNotes];
    });

    sum += (0.4 * 4) * 4;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sum * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self halfNotes];
    });

    sum += (0.4 * 2) * 4;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sum * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self quarterNotes];
    });

    sum += (0.4 * 1) * 4;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sum * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self quarterNotes];
    });
}

- (void)quarterNotesWithModifier:(double)modifier {
    double quarterNote = 0.4 * modifier;
    double halfNote = quarterNote * 2;
    double wholeNote = quarterNote * 4;

    for (double i = 0; i < wholeNote; i += quarterNote) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [JCHueLightMgr setLightRed];
        });

        i += quarterNote;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [JCHueLightMgr setLightOrange];
        });
    }
}

- (void)wholeNotes {
    [self quarterNotesWithModifier:4];
}

- (void)halfNotes {
    [self quarterNotesWithModifier:2];
}

- (void)quarterNotes {
    [self quarterNotesWithModifier:1];
}

- (void)eighthNotes {
    [self quarterNotesWithModifier:0.5];
}

@end

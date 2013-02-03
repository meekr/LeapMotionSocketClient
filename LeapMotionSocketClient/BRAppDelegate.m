//
//  BRAppDelegate.m
//  LeapMotionSocketClient
//
//  Created by Lei Perry on 2/3/13.
//  Copyright (c) 2013 BitRice. All rights reserved.
//

#import "BRAppDelegate.h"

@implementation BRAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[LeapDetector instance] run];
}

- (IBAction)connectSocketServer:(id)sender {
    NSLog(@"server address: %@", [self.ipAddress stringValue]);
    [[LeapDetector instance] connectSocket:[self.ipAddress stringValue]];
}

@end
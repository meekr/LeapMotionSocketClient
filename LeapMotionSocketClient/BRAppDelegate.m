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
    // Insert code here to initialize your application
}

- (IBAction)connectSocketServer:(id)sender {
    NSLog(@"server address: %@", [self.ipAddress stringValue]);
}
@end

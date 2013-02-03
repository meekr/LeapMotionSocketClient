//
//  BRAppDelegate.h
//  LeapMotionSocketClient
//
//  Created by Lei Perry on 2/3/13.
//  Copyright (c) 2013 BitRice. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LeapDetector.h"

@interface BRAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *ipAddress;

- (IBAction)connectSocketServer:(id)sender;

@end

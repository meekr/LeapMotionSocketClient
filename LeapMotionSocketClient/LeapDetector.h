//
//  LeapDetector.h
//  LeapMotionSocketClient
//
//  Created by Lei Perry on 2/3/13.
//  Copyright (c) 2013 BitRice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeapObjectiveC.h"
#import "GCDAsyncSocket.h"

@interface LeapDetector : NSObject<LeapDelegate, GCDAsyncSocketDelegate>
{
    LeapController *controller;
}

@property (nonatomic) GCDAsyncSocket *socket;

+ (LeapDetector *)instance;

- (void)run;
- (void)connectSocket:(NSString *)serverAddress;

@end
//
//  LeapDetector.m
//  LeapMotionSocketClient
//
//  Created by Lei Perry on 2/3/13.
//  Copyright (c) 2013 BitRice. All rights reserved.
//

#import "LeapDetector.h"


static LeapDetector *_instance;

@implementation LeapDetector

@synthesize socket = _socket;

+ (LeapDetector *)instance {
    if (!_instance)
        _instance = [[LeapDetector alloc] init];
    return _instance;
}

- (void)run
{
    controller = [[LeapController alloc] init];
    [controller addDelegate:self];
    NSLog(@"running");
}

- (void)connectSocket:(NSString *)serverAddress
{
    // start socket
    _socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError *err = nil;
    if (![_socket connectToHost:serverAddress onPort:54321 error:&err]) {
        NSLog(@"%@", err.description);
    }
    else {
        NSLog(@"ok, open port successfully");
    }
}

-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"connected to %@", host);
    [_socket readDataWithTimeout:-1 tag:0];
}


- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    NSLog(@"error: %@", err.description);
}

- (void)sendSocketMsg:(NSString *)message {
    if (_socket) {
        message = [NSString stringWithFormat:@"#%@", message];
        [_socket writeData:[message dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
        [_socket readDataWithTimeout:-1 tag:0];
    }
}

-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    //    NSString *newMessage = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //    NSLog(@"%@:%@", socket.connectedHost, newMessage);
    //[socket readDataWithTimeout:-1 tag:0];
}

#pragma mark - SampleDelegate Callbacks

- (void)onInit:(LeapController *)aController
{
    NSLog(@"Initialized");
}

- (void)onConnect:(LeapController *)aController
{
    NSLog(@"Connected");
}

- (void)onDisconnect:(LeapController *)aController
{
    NSLog(@"Disconnected");
}

- (void)onExit:(LeapController *)aController
{
    NSLog(@"Exited");
}

- (void)onFrame:(LeapController *)aController
{
    LeapFrame *frame = [aController frame:0];
    if (frame.hands.count == 1) {
        LeapHand *hand = [frame.hands objectAtIndex:0];
        if (hand.fingers.count >= 1) {
            LeapFinger *finger = [hand.fingers objectAtIndex:0];
            NSLog(@"x=%d, y=%d, z=%d", (int)round(finger.tipPosition.x), (int)round(finger.tipPosition.y), (int)round(finger.tipPosition.z));
            
        }
    }
}


@end
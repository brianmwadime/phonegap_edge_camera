//
//  EdgeCamera.h
//  EdgeCamera
//
//  Created by Shane Carr on 1/3/14.
//
//

#import <Cordova/CDV.h>

#import "ViewController.h"

@interface EdgeCamera : CDVPlugin

// Cordova command method
-(void) takePicture:(CDVInvokedUrlCommand*)command;

// Create and override some properties and methods (these will be explained later)
-(void) capturedImageWithPath:(NSData*)imageData;
-(void) dismissCamera;
@property (strong, nonatomic) ViewController* overlay;
@property (strong, nonatomic) CDVInvokedUrlCommand* latestCommand;
@property (readwrite, assign) BOOL hasPendingOperation;

@end

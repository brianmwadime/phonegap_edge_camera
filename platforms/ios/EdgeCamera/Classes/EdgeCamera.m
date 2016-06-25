//
//  EdgeCamera.m
//  EdgeCamera
//
//  Created by Brian Mwadime on 31/05/2016.
//
//

#import "EdgeCamera.h"

#ifndef __CORDOVA_4_0_0
#import <Cordova/NSData+Base64.h>
#endif

#define CDV_PHOTO_PREFIX @"cdv_photo_"

static NSString* toBase64(NSData* data) {
    SEL s1 = NSSelectorFromString(@"cdv_base64EncodedString");
    SEL s2 = NSSelectorFromString(@"base64EncodedString");
    SEL s3 = NSSelectorFromString(@"base64EncodedStringWithOptions:0");

    if ([data respondsToSelector:s1]) {
        NSString* (*func)(id, SEL) = (void *)[data methodForSelector:s1];
        return func(data, s1);
    } else if ([data respondsToSelector:s2]) {
        NSString* (*func)(id, SEL) = (void *)[data methodForSelector:s2];
        return func(data, s2);
    } else if ([data respondsToSelector:s3]) {
        NSString* (*func)(id, SEL, NSUInteger) = (void *)[data methodForSelector:s3];
        return func(data, s3, 0);
    } else {
        return nil;
    }
}

@implementation EdgeCamera

// - (void)execute:(CDVInvokedUrlCommand *)command {
//     [self takePicture:command];
// }

// Cordova command method
-(void) takePicture:(CDVInvokedUrlCommand *)command {
    NSLog(@"Initialized EdgeCamera");

    // Set the hasPendingOperation field to prevent the webview from crashing
    self.hasPendingOperation = YES;
    __weak EdgeCamera* weakSelf = self;
    // Save the CDVInvokedUrlCommand as a property.  We will need it later.
    weakSelf.latestCommand = command;

    // Make the overlay view controller.
//    self.overlay = [[ViewController alloc] initWithNibName:@"Main" bundle:nil];
    weakSelf.overlay = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController_Camera"];
//    [self presentViewController:self.overlay animated:YES completion:nil];
    weakSelf.overlay.plugin = self;

    // Display the view.  This will "slide up" a modal view from the bottom of the screen.
    [weakSelf.viewController presentViewController:self.overlay animated:YES completion:nil];
}

-(void)dismissCamera{
    __weak EdgeCamera* weakSelf = self;
    [weakSelf.overlay dismissViewControllerAnimated:YES completion:nil];
}

// // Method called by the overlay when the image is ready to be sent back to the web view
 -(void) capturedImageWithPath:(NSData*)imageData {
     [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:toBase64(imageData)] callbackId:self.latestCommand.callbackId];

     // Unset the self.hasPendingOperation property
     self.hasPendingOperation = NO;

     // Hide the picker view
     [self.viewController dismissViewControllerAnimated:YES completion:nil];
 }

@end

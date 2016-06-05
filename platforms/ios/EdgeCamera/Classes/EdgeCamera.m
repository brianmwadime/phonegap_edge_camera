//
//  EdgeCamera.m
//  EdgeCamera
//
//  Created by Audrey Cheng on 31/05/2016.
//
//

#import "EdgeCamera.h"

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

// // Method called by the overlay when the image is ready to be sent back to the web view
 -(void) capturedImageWithPath:(NSString*)imagePath {
     [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:imagePath] callbackId:self.latestCommand.callbackId];

     // Unset the self.hasPendingOperation property
     self.hasPendingOperation = NO;

     // Hide the picker view
     [self.viewController dismissViewControllerAnimated:YES completion:nil];
 }

@end

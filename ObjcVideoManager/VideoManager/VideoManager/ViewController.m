//
//  ViewController.m
//  VideoManager
//
//  Created by MD Abul Kashem on 25/12/20.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)loadVideoFromDeviceLibrary:(id)sender {
    //Check permission
    if ([self checkCameraAuthorization] == YES){
        //Load view controller
    } else {
        //Do nothing
    }
    //Load view controller
}

-(BOOL) checkCameraAuthorization {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status) {
        case PHAuthorizationStatusAuthorized:
            //Alredy have the access
            break;
        case PHAuthorizationStatusDenied:
            [self showingPopUpForWaning];
            return NO;
        case PHAuthorizationStatusNotDetermined:
            // Access has not been determined.
            return [self showingPopUpForLibraryAccess];
        default:
            return NO;
            // Restricted access - normally won't happen.
    }
    return NO;
    
}

-(BOOL)showingPopUpForLibraryAccess {
    __block BOOL stat = NO;
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        
        if (status == PHAuthorizationStatusAuthorized) {
            // Access has been granted.
            stat = YES;
        }
        
        else {
            [self showingPopUpForWaning];
            // Access has been denied.
        }
    }];
    return stat;
}

-(void)showingPopUpForWaning {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Warning"
                                   message:@"Please go to setting and change app permission"
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

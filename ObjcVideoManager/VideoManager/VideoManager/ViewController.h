//
//  ViewController.h
//  VideoManager
//
//  Created by MD Abul Kashem on 25/12/20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *choseVideo;
- (IBAction)loadVideoFromDeviceLibrary:(id)sender;

@end


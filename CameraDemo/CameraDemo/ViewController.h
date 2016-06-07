//
//  ViewController.h
//  CameraDemo
//
//  Created by Ruiyong.Z on 6/5/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController {
    IBOutlet UIView * frameforcapture;
    IBOutlet UIImageView *imageview;
}

- (IBAction)takephoto:(id)sender;

@end


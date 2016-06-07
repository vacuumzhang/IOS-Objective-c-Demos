//
//  ViewController.h
//  FacebookLogin
//
//  Created by Ruiyong.Z on 5/30/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;


@end


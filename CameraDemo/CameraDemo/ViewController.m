//
//  ViewController.m
//  CameraDemo
//
//  Created by Ruiyong.Z on 6/5/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

AVCaptureSession * session;
AVCaptureStillImageOutput * StillImageOutput;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    
    if ([session canAddInput:deviceInput]) {
        [session addInput:deviceInput];
    }
    
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = frameforcapture.frame;
    
    [previewLayer setFrame:frame];
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    StillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSetting = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [StillImageOutput setOutputSettings:outputSetting];
    
    [session addOutput:StillImageOutput];
    
    [session startRunning];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takephoto:(id)sender {
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in StillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
    }
    [StillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer != NULL) {
            NSData *imageDate = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage *image = [UIImage imageWithData:imageDate];
            imageview.image = image;
        }
    }];
    
}

@end

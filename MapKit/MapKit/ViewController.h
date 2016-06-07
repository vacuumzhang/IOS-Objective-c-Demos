//
//  ViewController.h
//  GoogleMapDemo
//
//  Created by Ruiyong.Z on 5/30/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate>{
    MKMapView *mapview;
}

@property (strong, nonatomic) NSMutableArray *matchingItems;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UITextField *searchText;

- (IBAction)zoomIn:(id)sender;
- (IBAction)changeMapType:(id)sender;
- (IBAction)textFieldReturn:(id)sender;


@end


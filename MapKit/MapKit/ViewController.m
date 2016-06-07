//
//  ViewController.m
//  GoogleMapDemo
//
//  Created by Ruiyong.Z on 5/30/16.
//  Copyright © 2016 Ruiyong Zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //show User Location on map
    self.mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //update user location when user move
    _mapView.centerCoordinate =
    userLocation.location.coordinate;
}

//zoom in map
- (IBAction)zoomIn:(id)sender {
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 20000, 20000);
    [_mapView setRegion:region animated:NO];
}

//change map type
- (IBAction)changeMapType:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
}

- (IBAction)textFieldReturn:(id)sender {
    NSLog(@"%@", self.searchText.text);
    [sender resignFirstResponder];
    [_mapView removeAnnotations:[_mapView annotations]];
    [self performSearch];
}



- (void) performSearch {
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    NSLog(@"%@", self.searchText.text);
    request.naturalLanguageQuery = _searchText.text;
    request.region = _mapView.region;
    
    _matchingItems = [[NSMutableArray alloc] init];
    
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems)
            {
                [_matchingItems addObject:item];
                MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
                annotation.coordinate = item.placemark.coordinate;
                annotation.title = item.name;
                [_mapView addAnnotation:annotation];
            }
    }];
}




@end

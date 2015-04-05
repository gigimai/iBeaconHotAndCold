//
//  GetViewController.m
//  iBeacons Hot and Cold
//
//  Created by Long Nguyen on 07/01/14.
//  Copyright (c) 2013 MobileTuts. All rights reserved.
//

#import "GetViewController.h"

@interface GetViewController ()<CLLocationManagerDelegate>

@end

@implementation GetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"8F538708-E114-41DB-8AF8-70CA7E950860"];
    _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:1 minor:1 identifier:@"com.longnv.iBeacon"];
    [_locationManager startMonitoringForRegion:_beaconRegion];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LocationManager delegate
- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"Beacon");
    [_locationManager startRangingBeaconsInRegion:_beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    NSLog(@"Left");
    [_locationManager stopMonitoringForRegion:_beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons lastObject];
    
    self.UUID.text = beacon.proximityUUID.UUIDString;
    
    switch (beacon.proximity) {
        case CLProximityUnknown:
            _distanceLabel.text = @"Unknown Proximity";
            self.view.backgroundColor = [UIColor blackColor];
            break;
        case CLProximityImmediate:
            _distanceLabel.text = @"Immediate";
            self.view.backgroundColor = [UIColor redColor];
            break;
        case CLProximityNear:
            _distanceLabel.text = @"Near";
            self.view.backgroundColor = [UIColor orangeColor];
            break;
        case CLProximityFar:
            _distanceLabel.text = @"Far";
            self.view.backgroundColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }

}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    NSLog(@"%@", [region class].description);
    [_locationManager startRangingBeaconsInRegion:_beaconRegion];
}



@end

//
//  GetViewController.h
//  iBeacons Hot and Cold
//
//  Created by Long Nguyen on 07/01/14.
//  Copyright (c) 2013 MobileTuts. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface GetViewController : ViewController

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *UUID;

@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

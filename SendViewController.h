//
//  SendViewController.h
//  iBeacons Hot and Cold
//
//  Created by Long Nguyen on 07/01/14.
//  Copyright (c) 2013 MobileTuts. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface SendViewController : ViewController

@property (weak, nonatomic) IBOutlet UILabel *uuidLabel;
@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
@property (nonatomic, strong) NSDictionary *beaconPeripheralData;
@property (nonatomic, strong) CBPeripheralManager *peripheralManager;


@end

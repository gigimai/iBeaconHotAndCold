//
//  SendViewController.m
//  iBeacons Hot and Cold
//
//  Created by Long Nguyen on 07/01/14.
//  Copyright (c) 2013 MobileTuts. All rights reserved.
//

#import "SendViewController.h"

@interface SendViewController ()<CBPeripheralManagerDelegate>

@end

@implementation SendViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"77F353D0-285C-4606-B012-8A078FB96622"];
    _beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:1 minor:1 identifier:@"com.longnv.iBeacon"];
    _uuidLabel.text = _beaconRegion.proximityUUID.UUIDString;
    _beaconPeripheralData = [_beaconRegion peripheralDataWithMeasuredPower:nil];
    _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CBPeripheralManager delegate
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"On");
        [peripheral startAdvertising:_beaconPeripheralData];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Off");
        [peripheral stopAdvertising];
    }
}

@end

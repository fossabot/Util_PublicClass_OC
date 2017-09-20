//
//  LocationManager.h
//  LocationDemo
//
//  Created by hoomsun on 2017/5/23.
//  Copyright © 2017年 hoomsun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject <CLLocationManagerDelegate>

+ (LocationManager *)sharedManager;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, copy) NSString *administrativeArea;//省
@property (nonatomic, copy) NSString *city;              //市
@property (nonatomic, copy) NSString *subLocality;       //区
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, assign) CGFloat latitude;

/// 开始定位
- (void)findCurrentLocation;

@end

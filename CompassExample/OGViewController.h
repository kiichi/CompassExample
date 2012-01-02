//
//  OGViewController.h
//  CompassExample
//
//  Created by Kiichi Takeuchi on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>

@interface OGViewController : UIViewController<CLLocationManagerDelegate>{
	CLLocationManager *locationManager;
	IBOutlet UIImageView *compassImage;
}
@property (nonatomic,retain) CLLocationManager *locationManager;
@end

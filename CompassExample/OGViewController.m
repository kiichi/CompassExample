//
//  OGViewController.m
//  CompassExample
//
//  Created by Kiichi Takeuchi on 1/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OGViewController.h"

@implementation OGViewController
@synthesize locationManager;

- (void)viewDidLoad{
    [super viewDidLoad];
	locationManager=[[CLLocationManager alloc] init];
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationManager.headingFilter = 1;
	locationManager.delegate=self;
	[locationManager startUpdatingHeading];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
	// Convert Degree to Radian and move the needle
	float oldRad =  -manager.heading.trueHeading * M_PI / 180.0f;
	float newRad =  -newHeading.trueHeading * M_PI / 180.0f;		
	CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    theAnimation.fromValue = [NSNumber numberWithFloat:oldRad];
    theAnimation.toValue=[NSNumber numberWithFloat:newRad];
    theAnimation.duration = 0.5f;    
    [compassImage.layer addAnimation:theAnimation forKey:@"animateMyRotation"];
    compassImage.transform = CGAffineTransformMakeRotation(newRad);
	NSLog(@"%f (%f) => %f (%f)", manager.heading.trueHeading, oldRad, newHeading.trueHeading, newRad);	
}

@end

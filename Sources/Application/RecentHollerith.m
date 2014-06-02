//
//  RecentHollerith.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/19/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "RecentHollerith.h"
#import "ApplicationDelegate.h"
#import "plist.h"

@implementation RecentHollerith

- (id)init
{
	self = [ super init ] ;
	if ( self ) {
		plistKey = kRecentHollerith ;
	}
	return self ;
}

- (void)performOpen:(NSString*)path
{
	[ [ NSApp delegate ] openHollerithAtPath:path ] ;
}

@end

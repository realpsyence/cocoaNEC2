//
//  AuxView.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/24/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AuxView : NSView {
	Boolean drawInfoForOffScreen ;
}

- (void)setOffScreenType:(Boolean)state ;


@end

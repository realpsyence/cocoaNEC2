//
//  NCArc.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/17/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCWire.h"

@interface NCArc : NCWire {
	double arcRadius ;
	double startAngle ;
	double endAngle ;
}

- (void)setArcRadius:(double)value ;
- (void)setStartAngle:(double)value ;
- (void)setEndAngle:(double)value ;

@end

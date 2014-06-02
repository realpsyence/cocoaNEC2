//
//  NCHelix.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/19/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCArc.h"


@interface NCHelix : NCArc {
	double turnsSpacing ;
	double helixLength ;
	double startRadius ;
	double endRadius ;
}

- (void)setTurnsSpacing:(double)value ;
- (void)setHelixLength:(double)value ;
- (void)setStartRadius:(double)x ;
- (void)setEndRadius:(double)x ;

@end

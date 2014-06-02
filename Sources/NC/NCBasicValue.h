//
//  NCBasicValue.h
//  cocoaNEC
//
//  Created by Kok Chen on 1/17/12.
//  Copyright 2012 Kok Chen, W7AY. All rights reserved.
//

#import "NCValue.h"


@interface NCBasicValue : NCValue {
}

+ (id)basicValueWithValue:(NCValue*)original ;
- (void)setBasicValueFromValue:(NCValue*)v withType:(int)inType ;
	

@end

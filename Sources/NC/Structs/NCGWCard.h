//
//  NCGWCard.h
//  cocoaNEC
//
//  Created by Kok Chen on 5/30/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import "NCCard.h"
#import "NCNode.h"

@interface NCGWCard : NCCard {
	double f1 ;
	double f2 ;
	double f3 ;
	double f4 ;
	double f5 ;
	double f6 ;
	double f7 ;
	int i1 ;
	int i2 ;
	int i3 ;
	int i4 ;

	RuntimeStack *runtime ;
}

- (id)initWithRuntime:(RuntimeStack*)rt ;

- (void)setF1:(double)value ;
- (void)setF2:(double)value ;
- (void)setF3:(double)value ;
- (void)setF4:(double)value ;
- (void)setF5:(double)value ;
- (void)setF6:(double)value ;
- (void)setF7:(double)value ;

- (void)setI1:(int)value ;
- (void)setI2:(int)value ;
- (void)setI3:(int)value ;
- (void)setI4:(int)value ;


@end

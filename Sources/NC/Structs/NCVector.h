//
//  NCVector.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/1/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NCVector : NSObject {
	float x ;
	float y ;
	float z ;
	float array[3] ;
}

- (id)initWithX:(float)ix y:(float)iy z:(float)iz ;
- (id)initWithVector:(NCVector*)v ;
- (id)initWithVectorArray:(float*)ix ;

+ (NCVector*)vectorWithX:(float)ix y:(float)iy z:(float)iz ;
+ (NCVector*)vectorWithVector:(NCVector*)v ;
+ (NCVector*)vectorWithVector:(NCVector*)v scale:(float)factor ;
+ (NCVector*)vectorWithArray:(float*)ix ;
+ (NCVector*)vectorWithSum:(NCVector*)v to:(NCVector*)u ;
+ (NCVector*)vectorWithDifference:(NCVector*)v from:(NCVector*)u ;

//  accumulate
- (void)addVector:(NCVector*)v ;
- (void)subtractVector:(NCVector*)v ;

//  value of vector
- (float)dotWithVector:(NCVector*)v ;
- (float)length ;

- (void)scale:(float)factor ;

//	value of components of vector
- (void)setX:(float)ix y:(float)iy z:(float)iz ;

- (float*)get:(float*)v ;
- (void)set:(float*)v ;

- (float)component:(int)index ;
- (float)x ;
- (void)setX:(float)v ;
- (float)y ;
- (void)setY:(float)v ;
- (float)z ;
- (void)setZ:(float)v ;


@end

//
//  NCTransform.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/1/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NCVector.h"

@interface NCTransform : NSObject {
	float a[16] ;
}

- (id)initWithMatrix:(float*)m ;
- (id)initFromTransform:(NCTransform*)v ;
- (id)initByConcatenating:(NCTransform*)transform1 toTransform:(NCTransform*)transform2 ;
- (id)initWithIdentity ;
- (id)initWithScale:(float)scale ;
- (id)initWithTranslation:(NCVector*)u ;
- (id)initWithRotateX:(float)angle ;
- (id)initWithRotateY:(float)angle ;
- (id)initWithRotateZ:(float)angle ;

+ (id)transformWithMatrix:(float*)m ;
+ (id)transformWithIdentity ;
+ (id)transformWithScale:(float)scale ;
+ (id)transformWithTranslation:(NCVector*)u ;
+ (id)transformByConcatenating:(NCTransform*)transform1 toTransform:(NCTransform*)transform2 ;
+ (id)transformWithRotateX:(float)u ;
+ (id)transformWithRotateY:(float)u ;
+ (id)transformWithRotateZ:(float)u ;
+ (id)transformWithTransform:(NCTransform*)v ;
+ (id)transformWithTransform:(NCTransform*)v scale:(float)scale ;
+ (id)transformByConcatenating:(NCTransform*)transform1 toTransform:(NCTransform*)transform2 ;

- (void)transform:(NCVector*)vector to:(NCVector*)result ;
- (NCVector*)applyTransform:(NCVector*)vector ;

- (float)rotationMatrixElement:(int)i j:(int)j ;
- (float)translationElement:(int)i ;

- (float*)matrix ;	//  4x4 affine matrix

@end

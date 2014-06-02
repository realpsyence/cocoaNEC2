//
//  TransformObject.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/19/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TransformObject : NSObject {
	NSString *name ;
	NSMutableArray *transform ;
	NSMutableDictionary *plist ;
}

- (NSString*)name ;
- (void)setName:(NSString*)name ;
- (NSString*)valueAtIndex:(int)i ;
- (void)setValue:(NSString*)str atIndex:(int)i ;
- (Boolean)empty ;

- (NSArray*)transform ;

- (NSMutableDictionary*)makeTransform ;
- (void)releaseTransform ;
- (void)restoreTransform:(NSDictionary*)dict ;

@end

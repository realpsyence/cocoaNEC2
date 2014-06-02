//
//  CallStringForNC.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/17/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSMutableString (CallStringForNC)

- (void)addVect:(NSMatrix*)matrix addition:(NSString*)tail ;
- (void)appendArguments:(NSMatrix*)matrix count:(int)count addition:(NSString*)tail ;
- (void)appendTransform:(NSString*)transformName addition:(NSString*)tail ;
- (void)appendArgument:(id)field addition:(NSString*)tail ;

@end

//
//  Footer.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Output ;

@interface Footer : NSView {
	Output *output ;
}

- (void)setOutput:(Output*)obj ;

@end

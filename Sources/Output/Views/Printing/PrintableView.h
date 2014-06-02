//
//  PrintableView.h
//  cocoaNEC
//
//  Created by Kok Chen on 10/23/07.

#import <Cocoa/Cocoa.h>

@interface PrintableView : NSView {
	NSMutableDictionary *textAttributes, *infoAttributes ;
}

- (void)viewSelected:(Boolean)state ;		//  v0.81e

@end

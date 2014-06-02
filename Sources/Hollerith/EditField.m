//
//  EditField.m
//  cocoaNEC
//
//  Created by Kok Chen on 8/20/07.
//  Copyright 2007 Kok Chen, W7AY. All rights reserved.
//

#import "EditField.h"
#import "Hollerith.h"

@implementation EditField


- (NSRange)textView:(NSTextView*)aTextView willChangeSelectionFromCharacterRange:(NSRange)oldSelectedCharRange toCharacterRange:(NSRange)newSelectedCharRange
{
	Hollerith *delegate ;

	delegate = (Hollerith*)[ self delegate ] ;
	if ( delegate ) [ delegate selecting:newSelectedCharRange.location ] ;
	return newSelectedCharRange ;
}

@end

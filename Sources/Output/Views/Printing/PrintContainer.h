//
//  PrintContainer.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/20/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "OutputTypes.h"
#import "Footer.h"

@class Output ;


@interface PrintContainer : NSView {
	IBOutlet Footer *footer ;
}

- (Boolean)setUpWithPrintInfo:(NSPrintInfo*)printInfo output:(Output*)output ;
- (void)printWithInfo:(NSPrintInfo*)printInfo output:(Output*)output ;

- (Footer*)footer ;
- (void)setOutput:(Output*)control ;

- (void)updateColorsFromColorWells:(ColorWells*)wells ;
- (void)changeColor:(NSColorWell*)well ;
- (void)clearPatterns ;

@end

#define	FILENAMEOFFSET		40

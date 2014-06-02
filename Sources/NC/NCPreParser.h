//
//  NCPreParser.h	v0.52
//  cocoaNEC
//
//  Created by Kok Chen on 5/26/09.
//  Copyright 2009 Kok Chen, W7AY. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NCParser.h"
#import "NCSymbolTable.h"

@interface NCPreParser : NCParser {
}

- (void)parseForFunctionDefinitions:(NCSymbolTable*)globals ;

@end

//
//  NCIterate.h
//  cocoaNEC
//
//  Created by Kok Chen on 10/4/07.

	#import "NCNode.h"

	@class NCStatement ;
	@class NCExpression ;

	@interface NCIterate : NCNode {
		NCStatement *whileClause ;
		NCExpression *expr ;			// whle/repeat expression
	}

	@end

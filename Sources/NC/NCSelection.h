//
//  NCSelection.h
//  cocoaNEC
//
//  Created by Kok Chen on 10/4/07.

	#import "NCNode.h"

	@class NCStatement ;
	@class NCExpression ;

	@interface NCSelection : NCNode {
		NCStatement *ifClause ;
		NCStatement *elseClause ;
		NCExpression *expr ;			//  selection expression
	}
	
	@end

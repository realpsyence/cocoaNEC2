//
//  NCStatement.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/16/07.

	#import "NCNode.h"
	#import "NCExpression.h"
	#import "NCFunction.h"
	#import "NCSelection.h"
	#import "NCIterate.h"
	
	@class NCCompound ;

	@interface NCStatement : NCNode {		
		NCExpression *expression ;			// nil if nothing to execute
		NCSelection *ifStatement ;
		NCIterate *whileStatement ;
		NCIterate *repeatStatement ;
		NCCompound *compound ;
	}

	@end

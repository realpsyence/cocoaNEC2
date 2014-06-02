//
//  NCWire.h
//  cocoaNEC
//
//  Created by Kok Chen on 9/20/07.


#import "NCElement.h"
#import "NCNode.h"
#import "NCExcitation.h"
#import "NCLoad.h"
#import "NCNetwork.h"
#import "NCTermination.h"

@interface NCWire : NCElement {
	double radius ;
	double originalRadius ;						//  v0.75 radius for NEC-2 can be modified by the insulate command
	int segments ;
	NCExcitation *feed ;
	int feedSegment ;							//  v0.55
	NSMutableArray *arrayOfLoads ;				//  v0.75
	NSMutableArray *arrayOfNetworks ;			//  v0.48
	RuntimeStack *runtime ;
	
	//  GM card parameters
	WireCoord translate ;
	WireCoord rotate ;
			
	int tagForCurrentSource ;
}

- (id)initWithRuntime:(RuntimeStack*)rt ;

//  v0.77
+ (NCGeometry*)vector:(NCWire*)w1 to:(NCWire*)w2 ;

- (void)setRadius:(double)value ;
- (void)modifyRadius:(double)value ;
- (double)radius ;
- (void)setSegments:(int)value ;
- (int)segments ;
- (void)setFeedSegment:(int)value ;

- (void)setTag:(int)value ;
- (int)tag ;

//  v0.55
- (void)setTranslate:(WireCoord*)coord ;
- (void)setRotate:(WireCoord*)coord ;
- (NSString*)gmCard;

- (void)setExcitation:(NCExcitation*)excitation segment:(int)seg ;
- (NCExcitation*)excitation ;

- (void)addLoad:(NCLoad*)inLoad ;
- (NSArray*)loads ;

//  v0.81
- (WireCoord)coordAtSegment:(int)segment ;
- (void)addTermination:(NCTermination*)inLoad ;

- (void)addNetwork:(NCNetwork*)ntwork ;
- (NCNetwork*)networkAtIndex:(int)i ;										//  v0.48

@end

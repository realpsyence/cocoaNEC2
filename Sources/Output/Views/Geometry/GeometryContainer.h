//
//  GeometryContainer.h
//  cocoaNEC
//
//  Created by Kok Chen on 6/21/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "PrintContainer.h"

@class GeometryView ;
@class Output ;


@interface GeometryContainer : PrintContainer {
	IBOutlet GeometryView *geometryView ;
}

- (GeometryView*)geometryView ;

@end

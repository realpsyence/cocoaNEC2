//
//  ScalarView.m
//  cocoaNEC
//
//  Created by Kok Chen on 6/7/11.
//  Copyright 2011 Kok Chen, W7AY. All rights reserved.
//

#import "ScalarView.h"
#import "ApplicationDelegate.h"
#import "CubicRX.h"
#import "Output.h"
#import <complex.h>


@implementation ScalarView

- (void)setScrollOffset:(float)v
{
	NSScrollView *scrollView ;
	NSClipView *clipView ;
	NSRect clipBounds ;
	float maxScrollHeight, scrollHeight, height, cachedHeight, cachedScrollOffset  ;
	
	scrollView = [ self enclosingScrollView ] ;	
	clipView = [ scrollView contentView ] ;
	clipBounds = [ clipView bounds ] ;
	cachedHeight = clipBounds.size.height ;
	cachedScrollOffset = v ;
	
	height = [ self bounds ].size.height ;
	maxScrollHeight = height - cachedHeight ;
	scrollHeight = maxScrollHeight*v ;
	if ( scrollHeight < 0 ) scrollHeight = 0 ; else if ( scrollHeight > ( height - cachedHeight ) ) scrollHeight = height - cachedHeight ;
	clipBounds.origin.y = scrollHeight ;
	[ clipView scrollToPoint:clipBounds.origin ] ;
	[ scrollView reflectScrolledClipView:clipView ] ;
}

- (float)scrollOffset
{
	NSScrollView *scrollView ;
	NSClipView *clipView ;
	NSRect clipBounds ;
	float verticalClipRange ;
	
	scrollView = [ self enclosingScrollView ] ;	
	clipView = [ scrollView contentView ] ;
	clipBounds = [ clipView bounds ] ;
	
	verticalClipRange = [ self bounds ].size.height - clipBounds.size.height ;
	return clipBounds.origin.y/verticalClipRange ;
	
	//  same as ( 1.0 - [ [ scrollView verticalScroller ] floatValue ] ) if there is a vertical scroller ;
}

- (void)setupRXScale:(int)scaleIndex height:(float)height
{
	plotInfo.dataOffset = plotInfo.y0 = height/2 ;
	switch ( scaleIndex ) {
	case 0:
		//  600 ohms
		plotInfo.pixelsPerMinorVerticalGrid = 30 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*6 ;
		plotInfo.unitsPerVerticalGrid = 600 ;
		break ;
	case 1:
		//  200 ohms
		plotInfo.pixelsPerMinorVerticalGrid = 40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*4 ;
		plotInfo.unitsPerVerticalGrid = 200 ;
		break ;
	case 2:
		//  100 ohms
		plotInfo.pixelsPerMinorVerticalGrid = 40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 100 ;
		break ;
	default:
	case 3:
		//  50 ohms
		plotInfo.pixelsPerMinorVerticalGrid = 40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 50 ;
		break ;
	case 4:
		//  25 ohms
		plotInfo.pixelsPerMinorVerticalGrid = 40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 25 ;
		break ;
	case 5:
		//  20 ohms
		plotInfo.pixelsPerMinorVerticalGrid = 30 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 10 ;
		break ;
	}
}

- (void)setupSWRScale:(int)scaleIndex height:(float)height
{
	switch ( scaleIndex ) {
	case 0:
		//  6:1
		plotInfo.pixelsPerMinorVerticalGrid = 32 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 5 ;
		break ;
	case 1:
		//  4:1
		plotInfo.pixelsPerMinorVerticalGrid = 60 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*3 ;
		plotInfo.unitsPerVerticalGrid = 3 ;
		break ;
	case 2:
		//  3:1
		plotInfo.pixelsPerMinorVerticalGrid = 50 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*4 ;
		plotInfo.unitsPerVerticalGrid = 2 ;
		break ;
	default:
	case 3:
		//  2:1
		plotInfo.pixelsPerMinorVerticalGrid = 40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 1 ;
		break ;
	case 4:
		//  1.5:1
		plotInfo.pixelsPerMinorVerticalGrid = 40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 0.5 ;
		break ;
	case 5:
		//  1.1:1
		plotInfo.pixelsPerMinorVerticalGrid = 30 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 0.1 ;
		break ;
	}
	plotInfo.y0 = -plotInfo.pixelsPerVerticalGrid ;
	plotInfo.dataOffset =  -plotInfo.pixelsPerVerticalGrid/plotInfo.unitsPerVerticalGrid ;
}

- (void)setupReturnLossScale:(int)scaleIndex height:(float)height
{
	switch ( scaleIndex ) {
	case 0:
		//  60 dB
		plotInfo.pixelsPerMinorVerticalGrid = -20 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*6 ;
		plotInfo.unitsPerVerticalGrid = 60 ;
		break ;
	case 1:
		//  40 dB
		plotInfo.pixelsPerMinorVerticalGrid = -40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*4 ;
		plotInfo.unitsPerVerticalGrid = 40 ;
		break ;
	case 2:
		//  20 dB
		plotInfo.pixelsPerMinorVerticalGrid = -40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*4 ;
		plotInfo.unitsPerVerticalGrid = 20 ;
		break ;
	default:
	case 3:
		//  10 dB
		plotInfo.pixelsPerMinorVerticalGrid = -40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 10 ;
		break ;
	case 4:
		//  5 dB
		plotInfo.pixelsPerMinorVerticalGrid = -40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 5 ;
		break ;
	case 5:
		//  1 dB
		plotInfo.pixelsPerMinorVerticalGrid = -40 ;
		plotInfo.pixelsPerVerticalGrid = plotInfo.pixelsPerMinorVerticalGrid*5 ;
		plotInfo.unitsPerVerticalGrid = 1 ;
		break ;
	}
	plotInfo.y0 = plotInfo.dataOffset = 1e8 ;
}

- (void)setupHorizontalScale:(RXF*)rxfp frequencies:(int)n width:(float)width
{
	int i, decade, base ;
	float f, fmin, fmax, df, ef, logf, grids ;

	fmin = 1e12 ;
	fmax = 0 ;
	for ( i = 0; i < n; i++ ) {
		f = rxfp[i].frequency ;
		if ( f < fmin ) fmin = f ;
		if ( f > fmax ) fmax = f ;
	}	
	df = fmax - fmin ;

	//  readjust min and max for data that cannot be interpolated
	switch ( n ) {
	case 1:
		//  single point, no interpolation v0.81d
		if ( fmin <= 1.01 ) df = 0.05 ;
		else if ( fmin <= 30.0 ) df = fmin/20 ;
		else df = fmin/100 ;
		fmin -= df*0.5 ;
		fmax += df*0.5 ;
		break ;
	case 2:
	case 3:
		//  two and three points, never interpolated
		fmin -= df*0.5 ;
		fmax += df*0.5 ;
		break ;
	default:
		fmin -= df*0.01 ;
		fmax += df*0.01 ;
	}
	//  establish minimum frequency span
	if ( df < .001 ) {
		f = ( fmin+fmax )*0.5 ;
		fmin -= 0.001 ;
		fmax += 0.001 ;
	}	
	if ( plotInfo.minFreq != fmin || plotInfo.maxFreq != fmax || plotInfo.width != width ) {
		//  frequencyScale for horizintal axis has changed; recompute	
		plotInfo.minFreq = fmin ;
		plotInfo.maxFreq = fmax ;
		plotInfo.width = width ;
		//  find decade that fits into the frequency difference
		logf = log10( fmax-fmin ) ;
		if ( logf < 0 ) logf -= 1 ;
		decade = logf ;
		ef = pow( 10, decade ) ;
		grids = df/ef ;
		//  at this point, grids should be greater or equal to 0 and less than 10
		base = 1 ;
		if ( grids <= 2 ) {
			ef *= 0.2 ;
			decade-- ;
			base = 2 ;
		}
		else if ( grids <= 4 ) {
			ef *= 0.5 ;
			decade-- ;
			base = 5 ;
		}
		else if ( grids >= 12 ) {
			ef *= 2 ;
			base = 2 ;
		}
		decade= -decade ;
		if ( decade < 0 ) decade = 0 ;
		if ( decade != plotInfo.decade ) {
			plotInfo.decade = decade ;
			[ plotInfo.labelFormat autorelease ] ;
			plotInfo.labelFormat = [ [ NSString alloc ] initWithFormat:@"%c.%df", '%', decade ] ;
		}
		plotInfo.pixelsPerFrequencyGrid = plotInfo.frequencyLabelGrid = ef ;
		plotInfo.firstFrequencyGrid = plotInfo.firstFrequencyLabel = ( ( int )( fmin/ef ) + 1 )*ef ;
		//  if there are more than 5 grids, label every other one.
		if ( df/ef > 6.1 ) {
			plotInfo.frequencyLabelGrid = ef*2 ;
			plotInfo.firstFrequencyLabel += ef ;
		}
	}
}

- (void)drawGrids:(PDFConsumer*)p rxf:(RXF*)rxfp frequencies:(int)n plotType:(int)plotType scale:(int)scaleIndex width:(float)width height:(float)height
{
	int i, ix, iy, iz, my ;
	floatType dash[2] = { 1,4 } ;
	NSBezierPath *gridPath ;
	NSString *label ;
	NSColor *gridColor, *minorGridColor ;
	float f, x, z, hscale, bottom, top, gridWidth, minorGridWidth, saturation ;
	
	plotInfo.hasData = ( n > 0 ) ;
	
	if ( isScreen ) {
		gridColor = minorGridColor = [ NSColor colorWithCalibratedRed:gridRed green:gridGreen blue:gridBlue alpha:1.0 ] ;
		gridWidth = 0.8 ;
		minorGridWidth = 0.5 ;
	}
	else {
		if ( hasBackground ) {
			gridColor = [ NSColor colorWithCalibratedRed:gridRed green:gridGreen blue:gridBlue alpha:0.8 ] ;
			minorGridColor = [ NSColor colorWithCalibratedRed:gridRed green:gridGreen blue:gridBlue alpha:0.4 ] ;
		}
		else {
			saturation = 0.2 ;
			gridColor = [ NSColor colorWithCalibratedRed:0 green:saturation blue:0 alpha:0.9 ] ;
			minorGridColor = [ NSColor colorWithCalibratedRed:0 green:saturation blue:0 alpha:0.5 ] ;
		}
		dash[0] = 2000 ;
		dash[1] = 1 ;
		gridWidth = 0.9 ;
		minorGridWidth = 0.8 ;
	}
	//  vertical scale (horizontal grid lines)
	if ( n != 0 && ( plotType != selectedType || scaleIndex != selectedScale ) ) {
		selectedType = plotType ;
		selectedScale = scaleIndex ;
		plotInfo.height = height ;
		switch ( plotType ) {
		default:
		case kRXPlotType:
		case kImpedancePlotType:
			[ self setupRXScale:scaleIndex height:height ] ;	
			break ;
		case kSWRPlotType:
			[ self setupSWRScale:scaleIndex height:height ] ;
			break ;	
		case kReturnLossPlotType:
			[ self setupReturnLossScale:scaleIndex height:height ] ;
			break ;	
		}
	}
	if ( plotInfo.hasData ) {
		//  major horizontal grid lines
		gridPath = [ NSBezierPath bezierPath ] ;
		[ gridPath setLineDash:dash count:2 phase:0 ] ;
		[ gridPath setLineWidth:gridWidth ] ;
		[ gridColor set ] ;
		iy = ( plotInfo.pixelsPerVerticalGrid < 0 ) ? height-2 : plotInfo.y0 ;
		for ( i = 0; i < 100; i++ ) {
			[ gridPath moveToPoint:NSMakePoint( 0, iy+0.5 ) ] ;
			[ gridPath lineToPoint:NSMakePoint( width, iy+0.5 ) ] ;
			iy += plotInfo.pixelsPerVerticalGrid ;
			if ( iy >= height || iy < 0 ) break ;
		}
		if ( plotInfo.pixelsPerVerticalGrid > 0 ) {
			iy = plotInfo.y0 ;
			for ( i = 0; i < 100; i++ ) {
				iy -= plotInfo.pixelsPerVerticalGrid ;
				if ( iy <= 0 ) break ;
				[ gridPath moveToPoint:NSMakePoint( 0, iy+0.5 ) ] ;
				[ gridPath lineToPoint:NSMakePoint( width, iy+0.5 ) ] ;
			}
		}
		[ gridPath stroke ] ;

		// minor horizontal grid lines
		gridPath = [ NSBezierPath bezierPath ] ;
		[ gridPath setLineDash:dash count:2 phase:0 ] ;
		[ gridPath setLineWidth:minorGridWidth ] ;
		[ minorGridColor set ] ;		//  use reduced alpha so prinitng will work
		iy = ( ( plotInfo.pixelsPerVerticalGrid < 0 ) ? height-2 : plotInfo.y0 ) - plotInfo.pixelsPerMinorVerticalGrid ;
		my = 0 ;
		for ( i = 0; i < 100; i++ ) {
			iy += plotInfo.pixelsPerMinorVerticalGrid ;
			if ( iy >= ( height-5 ) ) break ;
			if ( ( my%plotInfo.pixelsPerVerticalGrid ) != 0 ) {
				[ gridPath moveToPoint:NSMakePoint( 0, iy+0.5 ) ] ;
				[ gridPath lineToPoint:NSMakePoint( width, iy+0.5 ) ] ;
			}
			my += plotInfo.pixelsPerMinorVerticalGrid ;
		}
		iy = plotInfo.y0 ;
		my = 0 ;
		for ( i = 0; i < 100; i++ ) {
			iy -= plotInfo.pixelsPerMinorVerticalGrid ;
			my += plotInfo.pixelsPerMinorVerticalGrid ;
			if ( iy <= 0 ) break ;
			if ( ( my%plotInfo.pixelsPerVerticalGrid ) != 0 ) {
				[ gridPath moveToPoint:NSMakePoint( 0, iy+0.5 ) ] ;
				[ gridPath lineToPoint:NSMakePoint( width, iy+0.5 ) ] ;
			}
		}
		[ gridPath stroke ] ;
		
		switch ( plotType ) {
		default:
		case kRXPlotType:
		case kImpedancePlotType:
			x = width - 15 ;
			iy = plotInfo.y0 ;
			iz = 0 ;
			for ( i = 0; i < 100; i++ ) {
				label = [ NSString stringWithFormat:@"%d Ω", iz ] ;
				[ label drawAtPoint:NSMakePoint( x - [ label length ]*5.1, iy+2 ) withAttributes:fontAttributes ] ;
				iy += plotInfo.pixelsPerVerticalGrid ;
				if ( iy >= height-10 ) break ;
				iz += plotInfo.unitsPerVerticalGrid ;
			}
			iy = plotInfo.y0 ;
			iz = 0 ;
			x -= 3 ;
			for ( i = 0; i < 100; i++ ) {
				iy -= plotInfo.pixelsPerVerticalGrid ;
				if ( iy <= 0 ) break ;
				iz -= plotInfo.unitsPerVerticalGrid ;
				label = [ NSString stringWithFormat:@"%d Ω", iz ] ;
				[ label drawAtPoint:NSMakePoint( x - [ label length ]*5.1, iy+2 ) withAttributes:fontAttributes ] ;
			}
			break ;
		case kSWRPlotType:
			x = width - 11 ;
			iy = plotInfo.y0 ;
			z = 1-plotInfo.unitsPerVerticalGrid ;
			for ( i = 0; i < 100; i++ ) {
				label = [ NSString stringWithFormat:@"%.1f : 1", z ] ;
				[ label drawAtPoint:NSMakePoint( x - [ label length ]*5.1, iy+2 ) withAttributes:fontAttributes ] ;
				iy += plotInfo.pixelsPerVerticalGrid ;
				if ( iy >= height-10 ) break ;
				z += plotInfo.unitsPerVerticalGrid ;
			}
			break ;
		case kReturnLossPlotType:
			x = width - 11 ;
			iy = height-2 ;
			iz = 0 ;
			for ( i = 0; i < 100; i++ ) {
				label = [ NSString stringWithFormat:@"%d dB", iz ] ;
				[ label drawAtPoint:NSMakePoint( x - [ label length ]*5.1 - 5, iy+2 ) withAttributes:fontAttributes ] ;
				iy += plotInfo.pixelsPerVerticalGrid ;
				if ( iy >= height-10 ) break ;
				iz += plotInfo.unitsPerVerticalGrid + 0.01 ;
			}
			break ;
		}
	}
	//  horizontal scale (vertical grid lines)
	if ( n != 0 ) [ self setupHorizontalScale:rxfp frequencies:n width:width ] ;	
	gridPath = [ NSBezierPath bezierPath ] ;
	[ gridPath setLineDash:dash count:2 phase:0 ] ;
	[ gridPath setLineWidth:minorGridWidth ] ;
	[ minorGridColor set ] ;
	if ( plotInfo.hasData ) {
		switch ( plotType ) {
		default:
		case kRXPlotType:
		case kImpedancePlotType:
			bottom = 0 ;
			top = height ;
			break ;
		}
		hscale = plotInfo.width/( plotInfo.maxFreq - plotInfo.minFreq ) ;
		//  draw vertical grid lines (should be fewer than 12)
		f = plotInfo.firstFrequencyGrid ;
		for ( i = 0; i < 20; i++ ) {
			x = ( f - plotInfo.minFreq )*hscale ;
			if ( x > width-5 ) break ;
			if ( x > 5 ) {
				ix = x ;
				[ gridPath moveToPoint:NSMakePoint( ix+0.5, bottom ) ] ;
				[ gridPath lineToPoint:NSMakePoint( ix+0.5, top ) ] ;				
			}
			f += plotInfo.pixelsPerFrequencyGrid ;
		}
		[ gridPath stroke ] ;
	}
	[ auxScalarView label:&plotInfo ] ;
}

static float value(NSPoint rx, float z0, int plotType )
{
	complex z, gamma ;
	float rho, y ;
	
	y = rx.x*z0 ;  //  real part
	if ( plotType != kRXPlotType ) {
		z = y + I*rx.y*z0 ;
		switch ( plotType ) {
		case kImpedancePlotType:
			y = cabs( z ) ;
			break ;
		case kSWRPlotType:
			gamma = ( z - z0 )/( z + z0 ) ;
			rho = cabs( gamma ) ;
			if ( rho > 0.9999 ) rho = 0.9999 ;
			y = ( 1+rho )/( 1-rho ) ;
			break ;
		case kReturnLossPlotType:
			gamma = ( z - z0 )/( z + z0 ) ;
			rho = cabs( gamma ) ;
			if ( rho < 1e-40 ) rho = 1e-40 ;
			y = 20.0*log10( rho ) ;
			break ;
		}
	}
	return y ;
}

- (void)drawData:(PDFConsumer*)p rxf:(RXF*)rxf frequencies:(int)n plotType:(int)plotType height:(float)height 
{
	int j, frequencyIndex ;
	float x, y, d, f, pixelsPerMHz, vScale, hOffset, vOffset ;
	NSPoint q, drawn ;
	CubicRX *interpolate ;

	//  place dots and interpolate if requested
	if ( outputContext != 0 ) {
		FeedpointCache *current = [ outputContext selectedFeedpointCache ] ;
		d = plotInfo.unitsPerVerticalGrid ;
		vScale = ( d < 0.01 ) ? 1.0 : fabs( plotInfo.pixelsPerVerticalGrid/d ) ;
		vOffset = plotInfo.dataOffset ;		// ReturnLoss method returns 1e8 for top offset
		if ( vOffset > ( height-2 ) ) vOffset = height-2 ;
		d = ( plotInfo.maxFreq - plotInfo.minFreq ) ;
		pixelsPerMHz = ( d < .001 ) ? 1.0 : plotInfo.width/d ;
		
		hOffset = plotInfo.minFreq ;		
		[ p setRGB:plotColor ] ; 
		
		if ( n > 3 && [ self doInterpolate ] ) {
			
			interpolate = [ [ CubicRX alloc ] initWithNumberOfPoints:n z0:z0 ] ;
			[ interpolate createInterpolants:rxf ] ;
			//  imaginary part
			if ( plotType == kRXPlotType ) {
				//  imaginary part of RX
				[ p save ] ;
				[ p setlinewidth:lineWidth ] ;
				[ p setunequaldash:0 on:2 off:4 ] ;
				[ p setRGB:alternatePlotColor ] ; 
				q = [ interpolate evaluate:0 ] ;	//  interpolated rx
				x = rxf[0].frequency ;
				y = q.y*z0 ;						//  imaginary term of rx, scaled by z0
				//  scale to plot
				x = ( x - hOffset )*pixelsPerMHz ;
				y = y*vScale + vOffset ;
				[ p moveto:x y:y ] ;
				drawn = NSMakePoint( x, y ) ;
				for ( j = 0; j < n-1; j++ ) {
					for ( f = 0.025; f < 1.01; f += 0.025 ) {
						q = [ interpolate evaluate:j+f ] ;
						x = rxf[j].frequency*(1-f) + rxf[j+1].frequency*(f) ;
						y = q.y*z0 ;
						//  scale to plot
						x = ( x - hOffset )*pixelsPerMHz ;
						y = y*vScale + vOffset ;
						q = NSMakePoint( x, y ) ;
						if ( pointDist( q, drawn ) > 4.0 ) {
							drawn = q ;
							[ p lineto:q.x y:q.y ] ;
						}
					}
				}
				if ( pointDist( q, drawn ) > 0.5 ) [ p lineto:q.x y:q.y ] ;
				[ p stroke ] ;
				[ p restore ] ;
			}
			//  real part
			[ p setRGB:plotColor ] ;
			q = [ interpolate evaluate:0 ] ;	//  interpolated rx 
			x = rxf[0].frequency ;
			y = value( q, z0, plotType ) ;
			//  scale to plot
			x = ( x - hOffset )*pixelsPerMHz ;
			y = y*vScale + vOffset ;
			[ p setlinewidth:lineWidth ] ;
			[ p moveto:x y:y ] ;
			drawn = NSMakePoint( x, y ) ;
			for ( j = 0; j < n-1; j++ ) {
				for ( f = 0.025; f < 1.01; f += 0.025 ) {
					q = [ interpolate evaluate:j+f ] ;
					x = rxf[j].frequency*(1-f) + rxf[j+1].frequency*(f) ;
					y = value( q, z0, plotType ) ;
					//  scale to plot
					x = ( x - hOffset )*pixelsPerMHz ;
					y = y*vScale + vOffset ;
					q = NSMakePoint( x, y ) ;
					if ( pointDist( q, drawn ) > 4.0 ) {
						drawn = q ;
						[ p lineto:q.x y:q.y ] ;
					}
				}
			}
			if ( pointDist( q, drawn ) > 0.5 ) [ p lineto:q.x y:q.y ] ;
			[ p stroke ] ;
			[ interpolate release ] ;
		}
		if ( plotType == kRXPlotType ) {
			//  first plot imaginary part of impedance, if it is RX plot
			[ p setRGB:alternatePlotColor ] ; 
			for ( j = 0; j < n; j++ ) {
				x = rxf[j].frequency ;
				y = rxf[j].rx.y*z0 ;  //  imaginary part of rx
				frequencyIndex = rxf[j].index ;
				//  scale to plot
				y = y*vScale + vOffset ;
				x = ( x - hOffset )*pixelsPerMHz ;
				[ self drawPoint:p x:x y:y radius:3.0 ] ;
			}
		}
		//  plot real part,|z|, swr or reflection coefficient
		[ p setRGB:plotColor ] ; 
		for ( j = 0; j < n; j++ ) {
			x = rxf[j].frequency ;
			y = value( rxf[j].rx, z0, plotType ) ;	//  real part
			frequencyIndex = rxf[j].index ;
			//  scale to plot
			y = y*vScale + vOffset ;
			x = ( x - hOffset )*pixelsPerMHz ;
			//  cache view location back into RXF element
			rxf[j].viewLocation = NSMakePoint( x, y ) ;
			if ( current->frequency < 0.001 || j != current->frequencyIndex ) {
				[ self drawPoint:p x:x y:y radius:3.5 ] ;
			}
			else {
				//  draw donut for feedpoint's selected frequency
				[ self drawSelectedPoint:p x:x y:y radius:3.5 ] ;
			}
		}
		//  caption for selected point
		if ( current->frequencyIndex >= 0 ) {
			[ auxScalarView setCaptionWithRXF:&rxf[ current->frequencyIndex ] z0:z0 plotType:plotType mainColor:plotColor altColor:alternatePlotColor ] ;
		}
		else {
			[ auxScalarView setCaptionWithRXF:nil z0:z0 plotType:plotType mainColor:plotColor altColor:alternatePlotColor ] ;
		}
	}
}

- (void)drawChart:(PDFConsumer*)p plotType:(int)plotType width:(float)width height:(float)height
{
	float u, v ;
	int i, j ;
	RXF *rxf ;

	[ self updateFeedpointFromOutputContext ] ;
	
	samples = 0 ;	
	if ( numberOfFrequencies > 0 ) {
		i = [ self selectedFeedpointFromMenu ] ;
		if ( i >= 0 && i < MAXFEEDPOINTS ) {
			//  only draw the selected feedpoint
			rxf = rxfArray[i] ;
			//  setup data array for interpolation
			for ( j = 0; j < numberOfFrequencies; j++ ) {
				RXtoUV( feedpointList[j].zr[i], feedpointList[j].zx[i], &u, &v ) ;
				if ( samples < MAXSWEEP ) {
					rxf[samples].uv = NSMakePoint( u, v ) ;
					rxf[samples].rx = NSMakePoint( feedpointList[j].zr[i], feedpointList[j].zx[i] ) ;
					rxf[samples].frequency = feedpointList[j].frequency ;
					rxf[samples].index = samples ;
					samples++ ;
				}
			}
			[ self sort:&rxf[0] samples:samples ] ;
			[ self drawGrids:p rxf:rxf frequencies:samples plotType:plotType scale:[ plotScaleMenu indexOfSelectedItem ] width:width height:height ] ;
			[ self drawData:p rxf:rxf frequencies:samples plotType:plotType height:height ] ;
			[ auxScalarView setNeedsDisplay:YES ] ;
		}
	}
}

- (int)plotType
{
	return [ [ plotTypeMenu selectedItem ] tag ] ;
}

- (void)drawRect:(NSRect)rect 
{
	NSGraphicsContext *graphicsContext ;
	NSClipView *clipView ;
	NSBezierPath *backgroundPath ;
	NSRect bounds, clipBounds ;
	NSPoint viewOrigin ;
	PDFConsumer *canvas ;
	float width, height ;
	
	[ self setupFeedpointMenu ] ;
	bounds = [ self bounds ] ;
	
	[ self makeOpticalScale:bounds ] ;
	
	//  self view is very large (to be scrollable); clip canvas agains the enclosing clip view
	clipView = ( NSClipView* )[ self superview ] ;

	if ( isScreen ) {
		//  use screen graphics port for display and draw entire Smith chart (ignore rect)
		viewOrigin = [ self convertPoint:NSMakePoint( 0, 0 ) toView:nil ] ;		//  view origin from context (window)
		clipBounds = [ clipView convertRect:[ clipView bounds ] toView:nil ];
		graphicsContext = [ NSGraphicsContext graphicsContextWithWindow:[ self window ] ] ;
		hasBackground = YES ;
		fontAttributes = fontAttributesWithBackground ;
	}
	else {
		//  for printing, width and height are passed in to -drawRect, and coordinates are relative to view
		viewOrigin = NSMakePoint( 0, 0 ) ;
		clipBounds = [ clipView bounds ] ;
		graphicsContext = [ NSGraphicsContext currentContext ] ;
		hasBackground = [ [ [ NSApp delegate ] output ] drawBackgrounds ] ;
		fontAttributes = ( hasBackground ) ? fontAttributesWithBackground : fontAttributesNoBackground ;
	}
	width = bounds.size.width ;
	height = bounds.size.height ;
	context = (CGContextRef)[ graphicsContext graphicsPort ] ;
	CGContextRetain( context ) ;
	//	Note: canvas is relative to NSWindow's coordinate.
	canvas = [ [ PDFConsumer alloc ] initWithContext:context width:1200 height:1200 ] ;
	[ canvas newpath ] ;
	[ canvas rect:clipBounds.origin.x y:clipBounds.origin.y width:clipBounds.size.width height:clipBounds.size.height ] ;
	[ canvas closepath ] ;
	[ canvas clip ] ;
	[ canvas translate:viewOrigin.x y:viewOrigin.y ] ;
	//  draw background
	if ( isScreen || hasBackground ) {
		//  dark background
		backgroundPath = [ NSBezierPath bezierPathWithRect:[ self bounds ] ] ;
		[ backgroundColor set ] ;
		[ backgroundPath fill ] ;
		plotColor = plotColorWithBackground ;
		alternatePlotColor = alternatePlotColorWithBackground ;
		donutHoleColor = backgroundColor ;
		lineWidth = 1.2 ;
	}
	else {
		//  white background for printing
		plotColor = plotColorNoBackground ;
		alternatePlotColor = alternatePlotColorNoBackground ;
		donutHoleColor = white ;
		lineWidth = 2 ;
	}
	//	plot data
	[ self drawChart:canvas plotType:[ self plotType ] width:width height:height ] ;
	[ canvas release ] ;
	CGContextRelease( context ) ;
}

- (void)setInterface:(NSControl*)object to:(SEL)selector
{
	[ object setAction:selector ] ;
	[ object setTarget:self ] ;
}

static NSString *rxTitle[] = { @"600 Ω", @"200 Ω", @"100 Ω", @"50 Ω", @"25 Ω", @"10 Ω" } ;
static NSString *swrTitle[] = { @"6.0 : 1", @"4.0 : 1", @"3.0 : 1", @"2.0 : 1", @"1.5 : 1", @"1.1 : 1" } ;
static NSString *reflectionTitle[] = { @"60 dB", @"40 dB", @"20 dB", @"10 dB", @"5 dB", @"1 dB" } ;

- (void)setRXScaleMenu
{
	int i ;
	
	for ( i = 0; i < 6; i++ ) [ [ plotScaleMenu itemAtIndex:i ] setTitle:rxTitle[i] ] ;
	[ plotScaleMenu selectItemAtIndex:scalarGainMenu[scalarType] ] ;
}

- (void)setSWRScaleMenu
{
	int i ;
	
	for ( i = 0; i < 6; i++ ) [ [ plotScaleMenu itemAtIndex:i ] setTitle:swrTitle[i] ] ;
	[ plotScaleMenu selectItemAtIndex:scalarGainMenu[scalarType] ] ;
}


- (void)setReflectionScaleMenu
{
	int i ;
	
	for ( i = 0; i < 6; i++ ) [ [ plotScaleMenu itemAtIndex:i ] setTitle:reflectionTitle[i] ] ;
	[ plotScaleMenu selectItemAtIndex:scalarGainMenu[scalarType] ] ;
}

- (void)awakeFromNib
{
	[ plotTypeMenu selectItemAtIndex:0 ] ;		//  choose RX
	scalarType = 0 ;
	[ self setRXScaleMenu ] ;
	[ self setScrollOffset:scalarScrollerLocation[ scalarType ] ] ;

	[ self setInterface:feedPoint to:@selector(recompute:) ] ;
	[ self setInterface:plotTypeMenu to:@selector(recompute:) ] ;
	[ self setInterface:plotScaleMenu to:@selector(recompute:) ] ;
	[ self setInterface:interpolateCheckbox to:@selector(recompute:) ] ;	
}

- (void)updatePlotType
{
	int newScalarType ;
	
	newScalarType = [ plotTypeMenu indexOfSelectedItem ] ;
	if ( newScalarType != scalarType ) {
		//  plot type menu changed, swap scroller locations
		scalarScrollerLocation[scalarType] = [ self scrollOffset ] ;
		scalarGainMenu[scalarType] = [ plotScaleMenu indexOfSelectedItem ] ;
		scalarType = newScalarType ;
		[ self setScrollOffset:scalarScrollerLocation[scalarType] ] ;
		//	change gain menuitem titles
		switch ( newScalarType ) {
		default:
		case 0:
		case 1:
			// RX or |Z|
			[ self setRXScaleMenu ] ;
			break ;
		case 2:
			[ self setSWRScaleMenu ] ;
			break ;
		case 3:
			[ self setReflectionScaleMenu ] ;
			break ;
		}
	}
}

- (void)recompute:(id)control
{
	[ self updatePlotType ] ;
	if ( printView ) [ printView updatePlotType ] ;
	[ self setNeedsDisplay:YES ] ;
}

- (void)setPrintView:(ScalarView*)pView
{
	printView = pView ;
}

static NSColor *baseColor( float r, float g, float b )
{
	return [ [ NSColor colorWithCalibratedRed:r green:g blue:b alpha:1 ] retain ] ;
}

- (id)initWithFrame:(NSRect)rect
{
	int i ;
	NSFont *font ;
	
	self = [ super initWithFrame:rect ] ;
	if ( self ) {
		isScreen = YES ;
		printView = nil ;
		selectedType = 0 ;
		lineWidth = 1 ;
		selectedScale = scalarType = -2 ;
		for ( i = 0; i < 4; i++ ) scalarGainMenu[i] = 3 ;
		scalarScrollerLocation[0] = 0.5 ;
		scalarScrollerLocation[1] = 0.5 ;
		scalarScrollerLocation[2] = 0.0 ;
		scalarScrollerLocation[3] = 1.0 ;
		plotInfo.hasData = NO ;
		plotInfo.labelFormat = [ [ NSString alloc ] initWithString:@"%.3f" ] ;
		plotInfo.decade = 3 ;
		
		//  plots
		backgroundColor = [ [ NSColor colorWithCalibratedRed:0 green:0.1 blue:0 alpha:1 ] retain ] ;
		gridRed = 0, gridGreen = 1, gridBlue = 0.1 ;
		plotColor = plotColorWithBackground = baseColor( 0.9, 0.8, 0 ) ;
		alternatePlotColor = alternatePlotColorWithBackground = baseColor( 0.1, 0.9, 1 ) ;
		plotColorNoBackground = baseColor( 1, 0, 0 ) ;
		alternatePlotColorNoBackground = baseColor( 1, 0, 0 ) ;
		
		//  text
		textColor = [ [ NSColor colorWithCalibratedRed:0 green:1 blue:0.5 alpha:0.8 ] retain ] ;
		//  font with color
		font = [ NSFont fontWithName: @"Lucida Grande" size: 10.8 ] ;
		fontAttributes = fontAttributesWithBackground = [ [ NSMutableDictionary alloc ] init ] ;
		[ fontAttributesWithBackground setObject:font forKey:NSFontAttributeName ] ;
		[ fontAttributesWithBackground setObject:textColor forKey:NSForegroundColorAttributeName ] ;
		//  black font
		fontAttributesNoBackground = [ [ NSMutableDictionary alloc ] init ] ;
		[ fontAttributesWithBackground setObject:font forKey:NSFontAttributeName ] ;
	}
	return self ;
}

//	select clicked location
- (Boolean)mouseDownInner:(NSEvent*)event
{
	NSPoint xy ;
	float dxy, d ;
	int index, j, frequencyIndex ;
	FeedpointCache target ;
	RXF *rxf ;
	
	if ( outputContext == nil ) return YES ; //  outputContext not yet defined
	target = *[ outputContext selectedFeedpointCache ] ;
	index = [ self selectedFeedpointFromMenu ] ;
	
	target.frequency = 0 ;
	target.frequencyIndex = 0 ;
	
	//	convert cursor location in window to view location
	xy = [ self convertPoint:[ event locationInWindow ] fromView:nil ] ;	
	dxy = 1e6 ;
	rxf = rxfArray[index] ;
	frequencyIndex = 0 ;
	for ( j = 0; j < numberOfFrequencies; j++ ) {
		d = pointDist( rxf[j].viewLocation, xy ) ;
		if ( d < dxy ) {
			dxy = d ;
			frequencyIndex = j ; // rxf[j].frequencyIndex ;
		}
	}
	if ( dxy > 10.0 ) {
		//  more than 10 pixels from a real point, do not beep if we are far away
		return ( dxy > 30 ) ; 
	}
	target.frequency = feedpointList[frequencyIndex].frequency ;
	target.frequencyIndex = frequencyIndex ;
	[ outputContext setFeedpointCache:&target feedpointNumber:index ] ;
	[ self setNeedsDisplay:YES ] ;
	return YES ;
}

- (void)dealloc
{
	[ backgroundColor release ] ;
	[ plotColorWithBackground release ] ;
	[ plotColorNoBackground release ] ;
	[ alternatePlotColorWithBackground release ] ;
	[ alternatePlotColorNoBackground release ] ;
	[ textColor release ] ;
	[ plotInfo.labelFormat release ] ;
	[ fontAttributesWithBackground release ] ;
	[ fontAttributesNoBackground release ] ;
	[ super dealloc ] ;
}

- (AuxScalarView*)auxView 
{
	return auxScalarView ;
}

@end

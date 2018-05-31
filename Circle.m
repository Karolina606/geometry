#import "Circle.h"

@implementation Circle

@synthesize radius;

-(float) area{
	return ( M_PI *  pow(radius, 3) );
}
-(float) circumference{
	return ( 2.0 * M_PI * radius );
}

@end

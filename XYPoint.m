#import "XYPoint.h"

@implementation XYPoint

@synthesize x, y;

//somethings do not works in this method
-(void) initX: (float) xVal initY: (float) yVal{
	[self init];
	x = xVal;
	y = yVal;
}

-(void) setX: (float) xVal setY: (float) yVal{
	x = xVal;
	y = yVal;
}
@end

#import "GraphicObject.h"
#include <math.h>

#define PI 3.1415

@interface Circle: GraphicObject{
	float radius;
}

@property float radius;

-(float) area;
-(float) circumference;

@end

#import "GraphicObject.h"

@interface Triangle: NSObject{
	float height;
	float base;
}

@property float height, base;

-(float) area;
-(float) pedimeter: (BOOL) isosceles;
-(void) setHeight: (float) h setBase: (float) b;
@end;

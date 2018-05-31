#import <Foundation/Foundation.h>
#import "GraphicObject.h"
#import "XYPoint.h"

@interface Ractangle: GraphicObject
{
	float width;
	float height;
	XYPoint * origin;
}

@property float width, height;

// setters
-(void) setWidth: (float) w andHeight: (float) h;
-(id) initWithWidth: (float) w andHeight: (float) h;
-(void) setOrigin: (XYPoint *) pt;

// getters
-(XYPoint *) origin;

// count
-(float) area;
-(float) pedimeter;

// make some actions
-(void) translate: (XYPoint *) vector;
-(BOOL) containsPoint: (XYPoint *) pt;
-(void) draw;
-(Ractangle *) intersect: (Ractangle *) ract;

@end

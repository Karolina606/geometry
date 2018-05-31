#import <Foundation/Foundation.h>

@interface XYPoint: NSObject{
	float x;
	float y;
}

@property float x, y;

//somethings do not works in this method
-(void) initX: (float) x initY: (float) y;
-(void) setX: (float) x setY: (float) y;

@end

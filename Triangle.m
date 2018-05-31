#import "Triangle.h"

@implementation Triangle

@synthesize height, base;

-(float) area{
	return 0.5 * height * base;
}
-(float) pedimeter: (BOOL) isosceles{
	if(isosceles){
		return 3 * base;
	}
	else{
		printf("I cannot give you a pedimeter I hae too less inforamtion about your triangle");
	}
	return -1.0;
}
-(void) setHeight: (float) h setBase: (float) b{
	height = h;
	base = b;
}
@end

#import "Square.h"

//implementation Square: Ractangle

@implementation Square

// setters
-(void) setSide: (float) s{
	[self setWidth: s andHeight: s];
}

-(id) initWithSide: (float) s{
	// setter and initializer
	self = [super init];
	
	if(self){
		[self setSide: s];
	}
	
	return self;
}

// getters
-(float) side{
	return width;
}

// OVERWRITTEN

-(id) init{
	return [self initWithSide: 0];
}

@end

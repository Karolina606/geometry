#import "Ractangle.h"

@implementation Ractangle

@synthesize width, height;

// setters
-(void) setWidth: (float) w andHeight: (float) h{
	width = w;
	height = h;
}

-(id) initWithWidth: (float) w andHeight: (float) h{
	self = [super init];
	
	if(self){
		[self setWidth: w andHeight: h];	
	}	

	return self;
}

-(void) setOrigin: (XYPoint *) pt{
	if(!origin){
		origin = [[XYPoint alloc] init];
	}

	origin.x = pt.x;
	origin.y = pt.y;
}

// getters
-(XYPoint *) origin{
	
	// copy the origin
	// we do not want to change value of origin form another object
	// we must to release refernece to originCopy in main function
	XYPoint * originCopy = [[XYPoint alloc] init];

	originCopy.x = origin.x;
	originCopy.y = origin.y;
	
	return originCopy;
}


// count
-(float) area{
	return self.width * self.height;
}

-(float) pedimeter{
	return 2 * (self.width + self.height);
}

// make some actions
-(void) translate: (XYPoint *) vector{
	origin.x += vector.x;
	origin.y += vector.y;
}

-(BOOL) containsPoint: (XYPoint *) pt{
	if( (pt.x >= origin.x) && (pt.x <= origin.x + width) && (pt.y >= origin.y) && (pt.y <= origin.y + height) ){
		return true;
	}
	else{
		return false;
	}
}

-(void) draw{

	// top
	printf(" ");
	for(int i = 0; i < width; i++){
		printf("-");	
	}

	printf("\n");
	
	// sides
	for(int i = 0; i < height; i++){
		printf("|");
		for(int j = 0; j < width; j++){
			printf(" ");
		}
		printf("|\n");
	}
	
	//bottom
	printf(" ");
	for(int i = 0; i < width; i++){
		printf("-");	
	}

	printf("\n");
}

-(Ractangle *) intersect: (Ractangle *) ract{
	Ractangle * intersect = [[Ractangle alloc] init];
	XYPoint * newOrigin = [[XYPoint alloc] init];
	
	// origin
	newOrigin.x = (self.origin.x > ract.origin.x)? self.origin.x : ract.origin.x;
	newOrigin.y = (self.origin.y > ract.origin.y)? self.origin.y : ract.origin.y;	

	// width
	if( (self.origin.x + self.width) < (ract.origin.x + ract.width) ){
		intersect.width = (self.origin.x + self.width) - newOrigin.x;
	}
	else{
		intersect.width = (ract.origin.x + ract.width) - newOrigin.x;
	}

	// height
	if( (self.origin.y + self.height) < (ract.origin.y + ract.height) ){
		intersect.height = (self.origin.y + self.height) - newOrigin.y;
	}
	else{
		intersect.height = (ract.origin.y + ract.height) - newOrigin.y;
	}
	
	// if ractangles haven't common area
	if(intersect.width <= 0 || intersect.height <= 0){
		intersect.width = 0;
		intersect.height = 0;
		newOrigin.x = 0;
		newOrigin.y = 0;
	}

	//we set origin to newOrigin
	[intersect setOrigin: newOrigin];

	return intersect;
}

// OVERWRITTEN dealloc method to free up memory
// taken by object XYPoint * origin in our class Ractangle
-(void) dealloc{

	//we release Ractangle's origin during: (Ractangle -> release -> dealloc)
	[origin release];

	// super dealloc is method of NSObject and it works normally
	// our Ractangle's dealloc is short and it needs help from NSObject's dealloc
	[super dealloc];
}

-(id) init{
	return [self initWithWidth: 0 andHeight: 0];
}

@end

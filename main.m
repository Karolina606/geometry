#import <Foundation/Foundation.h>
#import "XYPoint.h"
#import "GraphicObject.h"
#import "Ractangle.h"
#import "Square.h"
#import "Circle.h"
#import "Triangle.h"


int main(int argc, const char *argv[]){
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	// ------------------POINT--------------------
	NSLog(@"POINT");
	XYPoint * point = [[XYPoint alloc] init];
	float x, y;

	printf("X: ");
	scanf("%f", &x);
	
	printf("Y: ");
	scanf("%f", &y);

	[point setX: x setY: y];
	printf("x: %.2f\ny: %.2f\n\n", point.x, point.y);	

	// ----------------RACTANGLE------------------
	NSLog(@"RACTANGLE");
	Ractangle * ractangle = [[Ractangle alloc] init];
	float width, height;

	printf("Width: ");
	scanf("%f", &width);
	
	printf("Height: ");
	scanf("%f", &height);
	
	[ractangle setWidth: width andHeight: height];
	printf("Width: %.2f\nHeight: %.2f\nArea: %.2f\nPedimeter: %.2f\n", ractangle.width, ractangle.height, ractangle.area , [ractangle pedimeter]);
	
	//set ORIGIN of ractangle to point
	[ractangle setOrigin: point];
	printf("Origin: \n x: %.2f\n y: %.2f\n\n", ractangle.origin.x, ractangle.origin.y);

	//we test if ractangle's method origin makes good encapsulation
	XYPoint * somePoint = [ractangle origin];
	[somePoint setX: 1 setY: 1];
	printf("Origin: \n x: %.2f\n y: %.2f\n\n", ractangle.origin.x, ractangle.origin.y);

	//we translate origin by vector
	//XYPoint * vector = [[XYPoint alloc] initX: 1 initY: 1]; //something do not works
	/*XYPoint * vector = [[XYPoint alloc] init];
	[vector setX: 1 setY: 1];
	[ractangle translate: vector];
	printf("Origin (after translating vector[%.0f, %.0f]): \n x: %.2f\n y: %.2f\n\n", vector.x, vector.y, ractangle.origin.x, ractangle.origin.y);*/

	//is point in ractangle - XYPoint * point and x and y declared previously
	printf("Is point in ractangle?\n");

	printf("x: ");
	scanf("%f", &x);
	printf("y: ");
	scanf("%f", &y);

	[point setX: x setY: y];
	printf("%s\n\n", [ractangle containsPoint: point] ? "contain" : "do not contain" );

	//draw ractangle
	[ractangle draw];

	//RACTANGLE2 - we make intersection of two ractangles
	Ractangle * ractangle2 = [[Ractangle alloc] init];
	
	printf("Ractangle2:\n");
	
	printf("X of ractangle2.origin: ");	//point declared priviously
	scanf("%f", &x);
	
	printf("Y of ractangle2.origin: ");
	scanf("%f", &y);
	
	printf("Width: ");	//width declared priviously
	scanf("%f", &width);
	
	printf("Height: ");	//height declared priviously
	scanf("%f", &height);
	
	[ractangle2 setWidth: width andHeight: height];
	printf("Width: %.2f\nHeight: %.2f\n", ractangle2.width, ractangle2.height);
	
	//set origin of ractangle2
	[point setX: x setY: y];
	[ractangle2 setOrigin: point];
	printf("Origin: \n x: %.2f\n y: %.2f\n\n", ractangle2.origin.x, ractangle2.origin.y);
	
	//RACTANGLE3 - intersector of racnangle nad ractangle2
	Ractangle * ractangle3 = [ractangle intersect: ractangle2];	
	printf("Ractangle3:\n");
	printf("Width: %.2f\nHeight: %.2f\n", ractangle3.width, ractangle3.height);
	printf("Origin: \n x: %.2f\n y: %.2f\n\n", ractangle3.origin.x, ractangle3.origin.y);

	//-----------------SQUERE---------------------
	NSLog(@"SQUARE");
	Square * square = [[Square alloc] init];
	float side;

	printf("Side: ");
	scanf("%f", &side);
	
	[square setSide: side];
	printf("Side: %.2f\nArea: %.2f\nPedimeter: %.2f\n\n", [square side], [square area], [square pedimeter]);

	//-----------------CIRCLE---------------------
	NSLog(@"CIRCLE");
	Circle * circle = [[Circle alloc] init];
	float radius;

	printf("Radius: ");
	scanf("%f", &radius);
	
	[circle setRadius: radius];
	printf("Radius: %.2f\nArea: %.2f\nCircumferenc: %.2f\n\n", [circle radius], [circle area], [circle circumference]);

	//-----------------TRIANGLE---------------------
	NSLog(@"TRIANGLE");
	Triangle * triangle = [[Triangle alloc] init];
	float base;

	printf("Height: ");
	scanf("%f", &height); //height declared previously
	printf("Base: ");
	scanf("%f", &base);
	
	[triangle setHeight: height setBase: base];
	printf("Height: %.2f\nBase: %.2f\nArea: %.2f\nPedimeter: %.2f\n\n", [triangle height], [triangle base], [triangle area], [triangle pedimeter: YES]);
	
	//------------RELEASE SECTION----------------
	[ractangle release];
	[ractangle2 release];
	[ractangle3 release];
	[square release];
	[circle release];	
	[triangle release];
	
	//somePoint reference to originCopy (from method Ractangle.origin)
	//we allocated originCopy there
	//here (in main) somePoint is not allocated
	//somePoint = originCopy (we must dealloc memory by only one reference)
	[somePoint release]; 
	
	//[[ractangle origin] release]; we do not need this because we release origin from Ractangle's dealloc method
	[point release];
	
	//[vector release];

	[pool drain];

	return 0;
}

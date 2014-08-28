//
//  Draw2D.m
//  ios-drawing
//
//  Created by jack on 8/26/14.
//  Copyright (c) 2014 jack. All rights reserved.
//

#import "Draw2D.h"

@implementation Draw2D

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    
//    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
//    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
//    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 150);
    CGContextAddLineToPoint(context, 100, 200);
    CGContextAddLineToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 100, 100);
    
    CGContextStrokePath(context);
    
   // add rect
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGRect rectangle = CGRectMake(60,200,200,80);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    
    // add ellipse
    CGRect ellipse = CGRectMake(10 ,10,200,80);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    
    CGContextAddEllipseInRect(context, ellipse);
    
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context,
                                   [UIColor redColor].CGColor);

    CGContextFillEllipseInRect(context, ellipse);
//    CGColorSpaceRelease(colorspace);
//    CGColorRelease(color);
    
    // arc
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddArcToPoint(context, 100,200, 300,200, 100);
    CGContextStrokePath(context);
    
    
    //  Beize path
    CGContextMoveToPoint(context, 10, 200);
    CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
    CGContextStrokePath(context);
    
    // dash line
    CGFloat dashArray[] = {2,6,4,2};
    CGContextSetLineDash(context, 3, dashArray, 4);
    CGContextMoveToPoint(context, 10, 200);
    CGContextAddQuadCurveToPoint(context, 20, 10, 300, 200);
    CGContextStrokePath(context);
    
    
    // draw shadow
    CGSize  myShadowOffset = CGSizeMake (-10,  15);
    
    CGContextSaveGState(context);
    
    CGContextSetShadow (context, myShadowOffset, 5);
    
    CGContextSetLineDash(context, 0, 0, 0);
    
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor blueColor].CGColor);
    CGRect el = CGRectMake(60,170,200,80);
    CGContextAddEllipseInRect(context, el);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    
    // draw gradient
//    CGGradientRef gradient;
//    CGColorSpaceRef colorspace;
//    CGFloat locations[4] = { 0.0, 0.25, 0.5, 0.75 };
//    
//    NSArray *colors = @[(id)[UIColor redColor].CGColor,
//                        (id)[UIColor greenColor].CGColor,
//                        (id)[UIColor blueColor].CGColor,
//                        (id)[UIColor yellowColor].CGColor];
//    
//    colorspace = CGColorSpaceCreateDeviceRGB();
//    
//    gradient = CGGradientCreateWithColors(colorspace,
//                                          (CFArrayRef)colors, locations);
//    
//    CGPoint startPoint, endPoint;
//    startPoint.x = 10.0;
//    startPoint.y = 300.0;
//    
//    endPoint.x = 400;
//    endPoint.y = 400;
//    
//    CGContextDrawLinearGradient(context, gradient,
//                                startPoint, endPoint, 0);
    
    UIImage *myImage = [UIImage imageNamed:@"IMG_0355.JPG"];
    CGPoint imagePoint = CGPointMake(200, 300);
    [myImage drawAtPoint:imagePoint];
    
    [myImage drawInRect:CGRectMake(0, 300, 200, 200)];
    [self setNeedsDisplay];
  
}

@end

//
//  draw.m
//  ios-drawing-sampe2
//
//  Created by jack on 8/27/14.
//  Copyright (c) 2014 jack. All rights reserved.
//

#import "draw.h"

@implementation draw

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

//    UIGraphicsGetCurrentContext();
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0,200,200)];
//    path.lineWidth = 4;
//    [[UIColor grayColor] setStroke];
//    [path stroke];
//    
//    UIGraphicsEndImageContext();
    
//    CGRect rect1 = CGRectMake(0, 0, 200, 200);
//    UIBezierPath *shape1 = [UIBezierPath bezierPathWithOvalInRect:rect1];
//    rect.origin.x += 100;
//    UIBezierPath *shape2 = [UIBezierPath bezierPathWithOvalInRect:rect1];
//    UIGraphicsBeginImageContext(CGSizeMake(300, 200));
//    // First draw purple
//    [[UIColor purpleColor] set];
//    [shape1 fill];
//    // Then draw green
//    [[UIColor greenColor] set];
//    [shape2 fill];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImageView *imgview= [[UIImageView alloc] initWithImage:image];
//    [self addSubview:imgview];
    
    
}


@end

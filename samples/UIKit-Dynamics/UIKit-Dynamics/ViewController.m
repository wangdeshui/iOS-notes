//
//  ViewController.m
//  UIKit-Dynamics
//
//  Created by jack on 8/28/14.
//  Copyright (c) 2014 jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


UIDynamicAnimator* _animator;

// 添加重力
UIGravityBehavior * _gravity;

UICollisionBehavior* _collision;

BOOL _firstContact;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *square=[[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    square.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:square];
    
    
    
    _animator=[[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity=[[UIGravityBehavior alloc]initWithItems:@[square]];
    
    [_animator addBehavior:_gravity];
    
    
    
    // 处理碰撞
    UIView* barrier = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 130, 20)];
    barrier.backgroundColor = [UIColor redColor];
    [self.view addSubview:barrier];
    
    // 设置边界 及碰撞
//    _collision = [[UICollisionBehavior alloc] initWithItems:@[square, barrier]];
//    _collision.translatesReferenceBoundsIntoBoundary = YES;
    
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[square]];
    // add a boundary that coincides with the top edge
     _collision.translatesReferenceBoundsIntoBoundary = YES;
    
    CGPoint rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    
    _collision.action =  ^{
        NSLog(@"%@, %@",
              NSStringFromCGAffineTransform(square.transform),
              NSStringFromCGPoint(square.center));
       
    };
    
    _collision.collisionDelegate = self;
    
    
    [_animator addBehavior:_collision];

    
    //下面的代码创建了一个物体行为（item behavior），把它关联到方块，然后添加该行为到动画实例（animator）。弹性系数属性（elasticity）控制物体的
    //弹性，取 1.0 表示完全弹性碰撞，也就是说碰撞中没有能量或速度的损失。你刚刚设置了方块的弹性系数为 0.6，意味着方块在每次弹起的时候速度都会减慢。
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[square]];
    itemBehaviour.elasticity = 0.6;
    [_animator addBehavior:itemBehaviour];
    
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id)item
   withBoundaryIdentifier:(id)identifier atPoint:(CGPoint)p {
    NSLog(@"Boundary contact occurred - %@", identifier);
    
    UIView* view = (UIView*)item;
    view.backgroundColor = [UIColor yellowColor];
    [UIView animateWithDuration:0.3 animations:^{
        view.backgroundColor = [UIColor grayColor];
    }];
    
    
    if (!_firstContact)
    {
        _firstContact = YES;
        
        UIView* square = [[UIView alloc] initWithFrame:CGRectMake(30, 0, 100, 100)];
        square.backgroundColor = [UIColor grayColor];
        [self.view addSubview:square];
        
        [_collision addItem:square];
        [_gravity addItem:square];
        
        UIAttachmentBehavior* attach = [[UIAttachmentBehavior alloc] initWithItem:view
                                                                   attachedToItem:square];
        [_animator addBehavior:attach];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

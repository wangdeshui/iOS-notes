//
//  ViewController.m
//  ios-autolayout-code
//
//  Created by jack on 8/26/14.
//  Copyright (c) 2014 jack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setupViews];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupViews
{
    self.redView = [UIView new];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.redView.backgroundColor = [UIColor colorWithRed:0.95 green:0.47 blue:0.48 alpha:1.0];
    
    self.yellowView = [UIView new];
    self.yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    self.yellowView.backgroundColor = [UIColor colorWithRed:1.00 green:0.83 blue:0.58 alpha:1.0];
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.yellowView];
    
    
    NSDictionary *viewsDictionary = @{@"redView":self.redView, @"yellowView":self.yellowView};
    
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:viewsDictionary];
    
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:viewsDictionary];
    
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[redView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    [self.redView addConstraints:constraint_H];
    [self.redView addConstraints:constraint_V];
    
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
    
    
    
    
    NSArray *yellow_constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[yellowView(200)]"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    
    NSArray *yellow_constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[yellowView(100)]"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:viewsDictionary];
    [self.yellowView addConstraints:yellow_constraint_H];
    [self.yellowView addConstraints:yellow_constraint_V];
    
    
    NSArray *constraint_POS_H1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-10-[yellowView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    NSArray *constraint_POS_V1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[redView]-40-[yellowView]"
                                                                         options:0
                                                                         metrics:nil
                                                                           views:viewsDictionary];
    [self.view addConstraints:constraint_POS_V1];
    [self.view addConstraints:constraint_POS_H1];
    
//    
//    NSArray *constraint_POS = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-10-[yellowView]"
//                                                                      options:NSLayoutFormatAlignAllTop
//                                                                      metrics:nil
//                                                                        views:viewsDictionary];
    
//    NSDictionary *metrics = @{@"redWidth": @100,
//                              @"redHeight": @100,
//                              @"yellowWidth": @100,
//                              @"yellowHeight": @150,
//                              @"topMargin": @120,
//                              @"leftMargin": @20,
//                              @"viewSpacing":@10
//                              };
//    
//    @"V:[redView(redHeight)]"
//    @"H:[redView(redWidth)]"
//    @"V:|-topMargin-[redView]"
//    @"H:|-leftMargin-[redView]-viewSpacing-[yellowView]"
    
//    
//    DEFINING CONSTRAINTS THROUGH RELATIONS
//constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant: (from now on I’ll just call it The_function :P ) of NSLayoutConstraints.
//    Thanks to The_function you can create constraints like this:
//    “redView width has to be the half of yellowView height plus 20 points”.
    
   
    /*
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.yellowView
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.redView
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.5
                              constant:0.0]];
     */
    // above is equal yellowView.width = redView.width * 0.5 + 0.0;
}

@end

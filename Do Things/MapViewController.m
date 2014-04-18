//
//  MapViewController.m
//  Do Things
//
//  Created by David Ladowitz on 4/17/14.
//  Copyright (c) 2014 Team1. All rights reserved.
//

#import "MapViewController.h"
#import "MotionViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

UIDynamicAnimator* _animator;
UIGravityBehavior* _gravity;
UICollisionBehavior* _collision;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Setting Nav Buttons
    UIBarButtonItem *rightButton =[[UIBarButtonItem alloc] initWithTitle:@"UIMotion" style:UIBarButtonItemStylePlain target:self action:@selector(onMotionButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    // UIImage View
    UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, 100, 100)];
    [headImage setImage:[UIImage imageNamed:@"JonHead"]];
    
    // UIViews
//    UIView *square  = [[UIView alloc] initWithFrame:CGRectMake(100, 0, 100, 110)];
//    square.backgroundColor = [UIColor whiteColor];
    
    UIView *barrier = [[UIView alloc] initWithFrame:CGRectMake(175, 200, 300, 10)];
    barrier.backgroundColor = [UIColor redColor];
    
//    [square addSubview:headImage];
    [self.view addSubview:headImage];
    [self.view addSubview:barrier];
    
    
   
    
    // Initialize animator, gravity and collision objects
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity  = [[UIGravityBehavior alloc] initWithItems:@[headImage]];
    _collision = [[UICollisionBehavior alloc] initWithItems:@[headImage]];
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[headImage]];

    
    
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // add an invisible boundary that coincides with the top edge. Red barries is only for human
    CGPoint rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    
    // Set Properties
    itemBehaviour.elasticity = .75;
    _gravity.magnitude = 1;
    // _gravity.angle = 180;
    
    // Adds to Animator
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
    [_animator addBehavior:itemBehaviour];
}

- (void)onMotionButton {
    MotionViewController *motionViewController = [[MotionViewController alloc] init];
    [self.navigationController pushViewController:motionViewController animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  PongViewController.m
//  Do Things
//
//  Created by David Ladowitz on 4/18/14.
//  Copyright (c) 2014 Team1. All rights reserved.
//

#import "PongViewController.h"
#import "MapViewController.h"
#import "MotionViewController.h"

@interface PongViewController ()

@property  (nonatomic, strong) UIAttachmentBehavior *attacher;

@end

@implementation PongViewController

UIDynamicAnimator*     _animator;
UICollisionBehavior*   _collider;
UIDynamicItemBehavior* _ballDynamicProperties;
UIDynamicItemBehavior* _paddleDynamicProperties;


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
    UIBarButtonItem *rightButton =[[UIBarButtonItem alloc] initWithTitle:@"Pin the Wes"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(onWesButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // Create Ball
    UIImageView *seanHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, 100, 100)];
    [seanHeadImageView setImage:[UIImage imageNamed:@"JonHead"]];
    [self.view addSubview:seanHeadImageView];
    
    // Create Paddle
    UIView *paddleView = [[UIView alloc] initWithFrame:CGRectMake(100, 250, 150, 30)];
    paddleView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:paddleView];

    // Start Ball Off With a Push
    UIPushBehavior *pusher = [[UIPushBehavior alloc] initWithItems:@[seanHeadImageView]
                                                   mode:UIPushBehaviorModeInstantaneous];
    pusher.pushDirection = CGVectorMake(0.5, 1.0);
    pusher.active  = YES;
    
    
    // Moving the Paddle
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapGR];
    
    // Adding Collisions
    _collider = [[UICollisionBehavior alloc] initWithItems:@[seanHeadImageView, paddleView]];
    _collider.collisionDelegate = self;
    _collider.collisionMode = UICollisionBehaviorModeEverything;
    _collider.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collider];
    
    // Change Propeties of views
    _ballDynamicProperties = [[UIDynamicItemBehavior alloc] initWithItems:@[seanHeadImageView]];
    _ballDynamicProperties.allowsRotation = YES;
    _ballDynamicProperties.density = 0.5f;
    _ballDynamicProperties.elasticity = 1.0f;
    _ballDynamicProperties.friction = 0.0;
    _ballDynamicProperties.resistance = 0.0;
    _ballDynamicProperties.angularResistance = 0.0f;
    [_animator addBehavior:_ballDynamicProperties];
    
    _paddleDynamicProperties  = [[UIDynamicItemBehavior alloc] initWithItems:@[paddleView]];
    _paddleDynamicProperties.density = 1000.0f;
    _paddleDynamicProperties.allowsRotation = NO;
    [_animator addBehavior:_paddleDynamicProperties];
    
    // Doing stuff to move the paddle
    self.attacher =
    [[UIAttachmentBehavior alloc]
     initWithItem:paddleView
     attachedToAnchor:CGPointMake(CGRectGetMidX(paddleView.frame),
                                  CGRectGetMidY(paddleView.frame))];
    
    [_animator addBehavior:self.attacher];
    
    
    // Pusher only happens once because it is instantaneous and not continuous
    [_animator addBehavior:pusher];
}


- (void)onWesButton {
    MotionViewController *motionViewController = [[MotionViewController alloc] init];
    [self.navigationController pushViewController:motionViewController animated:YES];
}

- (void)tapped:(UIGestureRecognizer *)gr
{
    self.attacher.anchorPoint = [gr locationInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

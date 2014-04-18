//
//  MotionViewController.m
//  Do Things
//
//  Created by David Ladowitz on 4/17/14.
//  Copyright (c) 2014 Team1. All rights reserved.
//

#import "MotionViewController.h"

@interface MotionViewController ()

@end

@implementation MotionViewController

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
    // Do any additional setup after loading the view from its nib.
    
    // Min and Max Values
    CGFloat leftRightMin = -200.0f;
    CGFloat leftRightMax =  800.0f;
    CGFloat upDownMin    = -150.0f;
    CGFloat upDownMax    =  150.0f;
    
    // Motion Effects
    UIInterpolatingMotionEffect *leftRight = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];

    leftRight.minimumRelativeValue = @(leftRightMin);
    leftRight.maximumRelativeValue = @(leftRightMax);
    
    // Motion Effect
    UIInterpolatingMotionEffect *upDown = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    upDown.minimumRelativeValue = @(upDownMin);
    upDown.maximumRelativeValue = @(upDownMax);
    
    //Create a Motion Effect Group
    UIMotionEffectGroup *meGroup = [[UIMotionEffectGroup alloc] init];
    meGroup.motionEffects = @[leftRight, upDown];
    
    // Add the Motion Effect Group to our imageView
//    [self.backgroundImageView addMotionEffect:meGroup];
    [self.wesHead addMotionEffect:meGroup];
    
    NSLog(@"center: %@", NSStringFromCGPoint(self.wesHead.center));
    NSLog(@"frame: %@", NSStringFromCGRect(self.wesHead.frame));
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

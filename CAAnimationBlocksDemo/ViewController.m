//
//  ViewController.m
//  CAAnimationBlocksDemo
//
//  Created by Ralf Bernert on 18.12.13.
//  Copyright (c) 2013 bernertmedia. All rights reserved.
//

#import "ViewController.h"
#import "CAAnimation+Blocks.h"


@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *headline;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

@end


@implementation ViewController


-(void)viewDidLoad
{

    CALayer *backgroundLayer = self.backgroundImage.layer;
    CALayer *textLayer = self.headline.layer;
    
    textLayer.opacity = 0.0f;
    
    CABasicAnimation *fadeInAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeInAnimation.fromValue = @0.0;
    fadeInAnimation.toValue = @1.0;
    fadeInAnimation.duration = 0.6f;
    fadeInAnimation.removedOnCompletion = NO;
    fadeInAnimation.fillMode = kCAFillModeForwards;
    
    
    CABasicAnimation *zoomOutAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    zoomOutAnimation.fromValue = @1.1;
    zoomOutAnimation.toValue = @1.0;
    zoomOutAnimation.duration = 2.0f;
    [zoomOutAnimation setCompletion:^(BOOL finished) {
        
        [textLayer addAnimation:fadeInAnimation forKey:@"fadeIn"];
        
    }];
    
    [backgroundLayer addAnimation:zoomOutAnimation forKey:@"zoomOut"];
 
}

@end

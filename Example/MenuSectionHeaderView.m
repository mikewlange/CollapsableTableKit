//
//  MenuSectionHeaderView.m
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "MenuSectionHeaderView.h"

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@interface MenuSectionHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation MenuSectionHeaderView {
    BOOL isRotating;
}

@synthesize interactionDelegate = _interactionDelegate;

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:self];
    
    [self.interactionDelegate userTappedView:self atPoint:point];
}

-(void)openAnimated:(BOOL)animated {
    
    if (animated && !isRotating) {
        
        isRotating = YES;
        
        [UIView animateWithDuration:0.2 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            self.imageView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            isRotating = NO;
        }];
        
    } else {
        [self.layer removeAllAnimations];
        self.imageView.transform = CGAffineTransformIdentity;
        isRotating = NO;
    }
}

-(void)closeAnimated:(BOOL)animated {
    
    if (animated && !isRotating) {
        
        isRotating = YES;
        
        [UIView animateWithDuration:0.2 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            self.imageView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0f));
        } completion:^(BOOL finished) {
            isRotating = NO;
        }];
        
    } else {
        [self.layer removeAllAnimations];
        self.imageView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0f));
        isRotating = NO;
    }
}

+(CGFloat)minimumHeight {
    return 44.0f;
}

@end

//
//  RRNTableViewHeaderFooterView.m
//  CollapsableTableKit
//
//  Created by Robert Nash on 02/09/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import "RRNTableViewHeaderFooterView.h"

@implementation RRNTableViewHeaderFooterView

@synthesize titleLabel = _titleLabel;

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:self];
    
    [self.interactionDelegate userTappedView:self atPoint:point];
}

-(void)openAnimated:(BOOL)animated {
    
}

-(void)closeAnimated:(BOOL)animated {
    
}

@end

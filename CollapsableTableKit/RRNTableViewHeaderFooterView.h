//
//  RRNTableViewHeaderFooterView.h
//  CollapsableTableKit
//
//  Created by Robert Nash on 02/09/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RRNTableViewHeaderFooterView;

@protocol RRNCollapsableTableViewSectionHeaderInteractionDelegate <NSObject>
-(void)userTappedView:(RRNTableViewHeaderFooterView *)view atPoint:(CGPoint)point;
@end

@protocol RRNCollapsableTableViewSectionHeaderProtocol <NSObject>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
-(void)openAnimated:(BOOL)animated;
-(void)closeAnimated:(BOOL)animated;
@end

@interface RRNTableViewHeaderFooterView : UITableViewHeaderFooterView <RRNCollapsableTableViewSectionHeaderProtocol>
@property (weak, nonatomic) id <RRNCollapsableTableViewSectionHeaderInteractionDelegate> interactionDelegate;
@end

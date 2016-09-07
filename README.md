Collapsable Table Kit
=====================
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic&label=Legal)](https://raw.githubusercontent.com/rob-nash/InfiniteScroll/master/LICENCE.md)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-green.svg)](https://github.com/Carthage/Carthage)

##Description
A table view comprised of x sections, all of which can collapse or expand like an accordion, when tapping the section header. The creative design and style of the table view and it's headers, are at the mercy of the implementing developer. Please contribute to pre-built table view designs [here](https://github.com/rob-nash/CollapsableTableHeaders).

##Dependencies
<sup>XCode 6.4+ iOS 8.0+</sup>

### Installation
Add the following to your Cartfile. See [Carthage](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) for details.

```ogdl
github "rob-nash/CollapsableTableKit"
```

## Usage
1. Build a UITableView, either in code or from interface builder.
2. Subclass RRNTableViewHeaderFooterView and override all of it's public methods. Create a nib for this subclass with the same filename.
3. Subclass RRNCollapsableTableViewController and override all of it's public methods.

Your RRNTableViewHeaderFooterView subclass would look something like this.

```objective-c
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

//Optional
-(void)updateTitle:(NSString *)title {
    self.titleLabel.text = title;
}
```

Your RRNCollapsableTableViewController subclass should look something like this.

```objective-c
-(UITableView *)collapsableTableView {
    return self.tableView;
}

-(NSString *)sectionHeaderNibName {
    return NSStringFromClass([CustomSectionHeaderView class]);
}

-(NSBundle *)sectionHeaderNibBundle {
    return [NSBundle bundleForClass:NSClassFromString([self sectionHeaderNibName])];
}

-(NSArray <RRNCollapsableTableViewSectionModelProtocol> *)menu {
    if (_menu == nil) {
        _menu = (NSArray <RRNCollapsableTableViewSectionModelProtocol> *)[FakeModelBuilder buildMenu];
    }
    return _menu;
}

-(NSArray <RRNCollapsableTableViewSectionModelProtocol> *)model {
    return self.menu;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [CustomSectionHeaderView minimumHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    id <RRNCollapsableTableViewSectionModelProtocol> mSection = self.menu[indexPath.section];
//    id item = mSection.items[indexPath.row];
    
    return [tableView dequeueReusableCellWithIdentifier:@"Cell"];
}
```

## Demo
See [CollapsableOptions](https://github.com/rob-nash/CollapsableOptions).

## Known issues
If you have > 8,000-10,000 rows in any given table view section, the framerate drops to a noticable level.

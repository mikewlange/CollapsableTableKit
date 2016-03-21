Collapsable Table Kit
=====================
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic&label=Legal)](https://raw.githubusercontent.com/rob-nash/InfiniteScroll/master/LICENCE.md)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-Greene.svg?style=plastic)](https://github.com/Carthage/Carthage)

##Description

<sup>XCode 6.4+ iOS 8.0+</sup>

A table view comprised of x sections, all of which can collapse or expand like an accordion, when tapping the section header. The creative design and style of the table view and it's headers, are at the mercy of the implementing developer.

Please contribute to pre-built table view designs [here](https://github.com/rob-nash/CollapsableOptions).

## Installation with Carthage
Add the following to your Cartfile. See [Carthage](https://github.com/Carthage/Carthage) for details.

* github "https://github.com/rob-nash/CollapsableTableKit" >= 1.0.0

After running Carthage, add the following framework to your project, as an embedded frameworks. See [Carthage](https://github.com/Carthage/Carthage) for details.

* CollapsableTableKit.framework

You may need to add a framework search path to your build settings that points at the carthage build folder.

##Demo
Try the Demo by running the 'Example' scheme. There are many other example implementations [here](https://github.com/rob-nash/CollapsableOptions)

## Usage
1. Build a UITableView, either in code or from interface builder.
2. Subclass UITableViewHeaderFooterView and conform to the RRNCollapsableSectionHeader Protocol. Create a nib for this subclass.
3. Subclass RRNCollapsableTableViewController and do the following inside your subclass:
	* override 'collapsableTableView' and return your table view
	* override 'model' and return a pointer to an array of objects, which conform to RRNCollapsableSectionItem Protocol.
	* override 'sectionHeaderNibName' and return the filename of the nib you created in step 2.

Your code should look something like this.

```objective-c
-(UITableView *)collapsableTableView {
    return self.tableView;
}

-(NSString *)sectionHeaderNibName {
    return NSStringFromClass([MenuSectionHeaderView class]);
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
    return [MenuSectionHeaderView minimumHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    id <RRNCollapsableTableViewSectionModelProtocol> mSection = self.menu[indexPath.section];
//    id item = mSection.items[indexPath.row];
    
    return [tableView dequeueReusableCellWithIdentifier:@"Cell"];
}
```

## Known issues
If you have > 8,000-10,000 rows in any given table view section, the framerate drops to a noticable level.

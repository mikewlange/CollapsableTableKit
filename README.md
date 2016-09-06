Collapsable Table Kit
=====================
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg?style=plastic&label=Legal)](https://raw.githubusercontent.com/rob-nash/InfiniteScroll/master/LICENCE.md)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-green.svg)](https://github.com/Carthage/Carthage)

##Dependencies
<sup>XCode 6.4+ iOS 8.0+</sup>
Dependency management is handled by [Carthage](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

##Description
A table view comprised of x sections, all of which can collapse or expand like an accordion, when tapping the section header. The creative design and style of the table view and it's headers, are at the mercy of the implementing developer.

Please contribute to pre-built table view designs [here](https://github.com/rob-nash/CollapsableOptions).

### Installation
Add the following to your Cartfile.

```ogdl
github "rob-nash/CollapsableTableKit"
```

## Usage
1. Build a UITableView, either in code or from interface builder.
2. Subclass RRNTableViewHeaderFooterView and override all of it's public methods. Create a nib for this subclass.
3. Subclass RRNCollapsableTableViewController and override all of it's public methods.

Your RRNCollapsableTableViewController subclass should look something like this.

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

## Demo
See [CollapsableOptions](https://github.com/rob-nash/CollapsableOptions).

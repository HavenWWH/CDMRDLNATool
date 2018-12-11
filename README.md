# CDMRDLNATool

[![CI Status](https://img.shields.io/travis/513433750@qq.com/CDMRDLNATool.svg?style=flat)](https://travis-ci.org/513433750@qq.com/CDMRDLNATool)
[![Version](https://img.shields.io/cocoapods/v/CDMRDLNATool.svg?style=flat)](https://cocoapods.org/pods/CDMRDLNATool)
[![License](https://img.shields.io/cocoapods/l/CDMRDLNATool.svg?style=flat)](https://cocoapods.org/pods/CDMRDLNATool)
[![Platform](https://img.shields.io/cocoapods/p/CDMRDLNATool.svg?style=flat)](https://cocoapods.org/pods/CDMRDLNATool)

## Example

### 投屏工具
[[CDDLNATool sharedInstance] searchDevicesBlock:^(NSMutableArray *devicesArray) {

NSLog(@"devices%@", devicesArray);
if (devicesArray.count == 0) return;

[[CDDLNATool sharedInstance] initDLNAWithDevice: devicesArray[0] playUrl: @""];
[[CDDLNATool sharedInstance] startDLNA];
}];

## Requirements

## Installation

CDMRDLNATool is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CDMRDLNATool'
```

## Author

513433750@qq.com, 513433750@qq.com

## License

CDMRDLNATool is available under the MIT license. See the LICENSE file for more info.

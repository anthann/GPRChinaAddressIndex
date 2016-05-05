# GPRChinaAddressIndex

[![CI Status](http://img.shields.io/travis/anthann/GPRChinaAddressIndex.svg?style=flat)](https://travis-ci.org/anthann/GPRChinaAddressIndex)
[![Version](https://img.shields.io/cocoapods/v/GPRChinaAddressIndex.svg?style=flat)](http://cocoapods.org/pods/GPRChinaAddressIndex)
[![License](https://img.shields.io/cocoapods/l/GPRChinaAddressIndex.svg?style=flat)](http://cocoapods.org/pods/GPRChinaAddressIndex)
[![Platform](https://img.shields.io/cocoapods/p/GPRChinaAddressIndex.svg?style=flat)](http://cocoapods.org/pods/GPRChinaAddressIndex)

中国行政区划，方便开发者制作用于选择省、市、区的控件。
常见的场景是方便电商app的用户编辑收货地址。

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

GPRChinaAddressIndex is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GPRChinaAddressIndex"
```

## Usage

```省
NSArray <GPRAddressModel *>*provinces = [[GPRChinaAddressIndex sharedInstance] getProvince];
```  

```市
NSArray <GPRAddressModel *>*cities = [[GPRChinaAddressIndex sharedInstance] getCityByProvinceID:@"110000"];
//110000是北京市(省级单位)的id，可以用过上一级列表检索到。接口返回北京市（省级）下属的市（因为是直辖市，cities.count == 1）。
```

```市
NSArray <GPRAddressModel *>*cities = [[GPRChinaAddressIndex sharedInstance] getTownByCityID:@"110100"];
//110100是北京市（市级单位）的id，可以用过上一级列表检索到。接口返回北京市下属各个区。
```


## Author

anthann, 72115165g@gmail.com

## License

GPRChinaAddressIndex is available under the MIT license. See the LICENSE file for more info.

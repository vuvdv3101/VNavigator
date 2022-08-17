# VNavigator


![Pod License](https://img.shields.io/cocoapods/l/VNavigator.svg?style=flat)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-green.svg?style=flat)](https://cocoapods.org)

`VNavigator` is a clean and easy-to-use navigation in SwiftUI base on UINavigationController in UIKit

## Installation

### From CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like `VNavigator` in your projects. First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'VNavigator'
```
- Using ``` Navigator/AppNavigator.swift ``` for Navigation
- Override AppNavigator:
```
struct LoginScreen: AppNavigator {
    var body: some View {
       Button("Login") {
             navigator.pushToView(view: HomeScreen())
       }
    }
}
```
- Change Root(when change root you can not back to old screen)
```
 navigator.changeRootView(rootView: TabbarScreen())
```
- Nativate to New Screen
```
 navigator.pushToView(view: HomeScreen())
```
- Go back
```
 navigator.pop()
```
- Pop to Root(go to first screen of node)
```
 navigator.popToRootView()
```
- Present View 
```
navigator.presentView(view: HomeScreen())
```
- Go back to a screen
```
navigator.popToView(HomeScreen.self)
```
## Requirements

+ Xcode 12+
+ iOS 13+
+ Swift 5.0+

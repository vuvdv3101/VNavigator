# VNavigator

![Pod Version](https://img.shields.io/cocoapods/v/VNavigator.svg?style=flat)
![Pod Platform](https://img.shields.io/cocoapods/p/VNavigator.svg?style=flat)
![Pod License](https://img.shields.io/cocoapods/l/VNavigator.svg?style=flat)
[![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-green.svg?style=flat)](https://cocoapods.org)

`VNavigator` is a clean and easy-to-use navigation in SwiftUI.

## Installation

### From CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like `VNavigator` in your projects. First, add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):

```ruby
pod 'VNavigator'
```
## Usage
- Wrap your ContentView with a ```NavigationView```
- In ContentView implement ```AppNavigator```
```
struct ContentView: AppNavigator {
    var body: some View {
        Button(action: {
            navigator.pushToView(view: DetailScreen1())
        }, label: {
            Text("Next to Detail Screen")
        })
    }
}
```
## Function support like you use with UIKit
- Push
``` navigator.pushToView(view: DetailScreen())```
- Pop
``` navigator.pop()```
- Pop to root
``` navigator.popToRootView()```
- Pop
``` navigator.popToView(DetailScreen.self)```
- Present
``` navigator.present(DetailScreen()))```
- Dismiss
``` navigator.dismiss()```

## Requirements

+ Xcode 12+
+ iOS 13+
+ Swift 5.0+

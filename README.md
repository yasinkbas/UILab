# UILab

[![CI Status](https://img.shields.io/travis/yasinkbas/UILab.svg?style=flat)](https://travis-ci.org/yasinkbas/UILab)
[![License](https://img.shields.io/cocoapods/l/UILab.svg?style=flat)]()
[![Platform](https://img.shields.io/cocoapods/p/UILab.svg?style=flat)]()

UILab is a simple group of extension frameworks designed to streamline and simplify the process of setting constraints in Swift-based UIKit projects for personal usage.

## Installation
Integrate UILab into your project using your preferred dependency manager (Swift Package Manager, CocoaPods, or Manuel). Detailed installation instructions can be found in the further in the Readme.

### Swift Package Manager
UILab is available through SPM. To Install it

* Go File -> Swift Packages -> Add Package Dependency
* Enter `https://github.com/yasinkbas/UILab`
* Click Add Package

### Manual
You can also manually integrate UILab into your project by downloading it from here.

### CocoaPods
UILab no longer supports Cocoapods, but you can still use the latest version `0.3.2` on Cocoapods.
To install it, add the following line to your Podfile:

```ruby
pod 'UILab'
```

## Usage
Begin creating constraints using the concise and expressive syntax provided by UILab. Whether you're working with views, labels, buttons, or any other UI element, UILab aims to simplify the process.

### Setting Constraints
You can use UILab as a matter of your taste. There are 3 ways to set constraints.

#### 1. With Set Function
```swift
class ViewController: UIViewController {
  private lazy var containerView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(containerView)
    containerView.set(.center(view), .width(100), .height(100))
  }
}
```
#### 2. With Subscript
```swift
class ViewController: UIViewController {
  private lazy var containerView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(containerView)
    var containerViewConstraints = containerView[.center(view), .width(100), .height(100)]
    containerViewConstraints.commit = true // activate
  }
}
```
**Note**: When using subscript style, you must set commit true to activate it.

#### 3. With ResultBuilder
```swift
class ViewController: UIViewController {
  private lazy var containerView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(containerView)
    containerView.set {
      ConstraintType.center(view, x: 9, y: 9)
      ConstraintType.width(100)
      ConstraintType.height(100)
    }
  }
}
```

#### Constraint Types
You can check all the available constraint types under `ConstraintType` [here](https://github.com/yasinkbas/UILab/blob/9dd2c10cf865277a3baf7d966b5ff5ecb9f0b7a2/Sources/UILab/Constraints/ConstraintTypes.swift#L78C13-L78C27).

### Getting Constraints
You can save for later your constraints before committing or retrieve them easily with `get` function.

#### Get constraints before committing

```swift
var contraintsYouWannaHold: Constraints
func setup() {
 contraintsYouWannaHold = myView[.center(anotherView), .width(100), .height(100)]
 contraintsYouWannaHold.commit = true // set true, when you want to activate it 
}
```
#### Getting active view constraint
```swift
let myViewHeightAnchor = myView.get(.height).first
```
## Example
To help you grasp the simplicity and power of UILab, let's delve into a few practical examples showcasing how to set constraints for common UI scenarios in [example project](https://github.com/yasinkbas/UILab/tree/master/Example).

**Note**: To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Contribution 

UILab is created for personal usage, but all contributions are welcome.

## License

UILab is available under the MIT license. See the LICENSE file for more info.

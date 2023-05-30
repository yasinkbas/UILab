# UILab

[![CI Status](https://img.shields.io/travis/yasinkbas/UILab.svg?style=flat)](https://travis-ci.org/yasinkbas/UILab)
[![Version](https://img.shields.io/cocoapods/v/UILab.svg?style=flat)](https://cocoapods.org/pods/UILab)
[![License](https://img.shields.io/cocoapods/l/UILab.svg?style=flat)](https://cocoapods.org/pods/UILab)
[![Platform](https://img.shields.io/cocoapods/p/UILab.svg?style=flat)](https://cocoapods.org/pods/UILab)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

### CocoaPods

UILab is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UILab'
```

### Swift Package Manager
UILab is available through SPM. To Install it

* Go File -> Swift Packages -> Add Package Dependency
* Enter `https://github.com/yasinkbas/UILab`
* Click Add Package

### Manual
You can also manually integrate UILab into your project by downloading it from here.

## Usage
Using UILab is a matter of your taste. There are 3 ways to use it.

### 1. With Enum Based Set Function
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
### 2. With Subscript
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
**Note**: When you use subscript style you always need to set commit true to activate it.

### 3. With ResultBuilder
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


## Setting Constraints Examples



## License

UILab is available under the MIT license. See the LICENSE file for more info.

# UILab
Simple Auto Layout provider, you can define your constraints on a line.

[![CI Status](https://img.shields.io/travis/yasinkbas/UILab.svg?style=flat)](https://travis-ci.org/yasinkbas/UILab)
[![Version](https://img.shields.io/cocoapods/v/UILab.svg?style=flat)](https://cocoapods.org/pods/UILab)
[![License](https://img.shields.io/cocoapods/l/UILab.svg?style=flat)](https://cocoapods.org/pods/UILab)
[![Platform](https://img.shields.io/cocoapods/p/UILab.svg?style=flat)](https://cocoapods.org/pods/UILab)

## TODO
- [ ] Add multiple support
- [ ] Write legible README
- [ ] Write documentation


## Example
#### NSLayoutConstraint
```swift
v.translatesAutoresizingMaskIntoConstraints = false
v.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
v.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32).isActive = true
v.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
v.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32).isActive = true

```

#### UILab
```swift
v.set(.left(self.view.left, 16), .top(self.view.top, 32), .right(self.view.right, 16), .bottom(self.view.bottom, 32))
```
To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Supported types and equivalent on NSLayoutConstraint
- {?} = ? is default value you don't have to write if you prefer default
- anchor = anchor of view left
- anchorView = the anchor will set with given view
- [left, right, top, bottom, leading, trailing] = "\($0)Anchor"

#### left(anchor, inset{0})              
view.left.constraint(equalTo: anchor, constant: inset)
#### leftOf(anchorView, inset{0})        
view.left.constraint(equalTo: anchorView.left, constant: inset)
#### leftgte(anchor, inset{0})   
view.left.constraint(greaterThanOrEqualTo: anchor, constant: inset)
#### leftlte(anchor, inset{0})
view.left.constraint(lessThanOrEqualTo: anchor, constant: inset)
#### right(anchor, inset{0})       
view.right.constraint(equalTo: anchor, constant: -inset)
#### rightOf(anchorView, inset{0})   
view.right.constraint(equalTo: anchorView.right, constant: -inset)
#### rightgte(anchor, inset{0})     
view.right.constraint(greaterThanOrEqualTo: anchor, constant: inset)
#### rightlte(anchor, inset{0})    
view.right.constraint(lessThanOrEqualTo: anchor, constant: inset)
#### top(anchor, inset{0})       
view.top.constraint(equalTo: anchor, constant: inset)
#### topOf(anchorView, inset{0})       
view.top.constraint(equalTo: anchorView.top, constant: inset)
#### topgte(anchor, inset{0})       
view.top.constraint(greaterThanOrEqualTo: anchor, constant: inset)
#### toplte(anchor, inset{0})     
view.top.constraint(lessThanOrEqualTo: anchor, constant: inset)
#### bottom(anchor, inset{0})     
view.bottom.constraint(equalTo: anchor, constant: -inset)
#### bottomOf(anchorView, inset{0})
view.bottom.constraint(equalTo: anchorView.bottom, constant: -inset)
#### bottomgte(anchor, inset{0})       
view.bottom.constraint(greaterThanOrEqualTo: anchor, constant: inset)
#### bottomlte(anchor, inset{0})        
view.bottom.constraint(lessThanOrEqualTo: anchor, constant: inset)
#### leading(anchor, inset{0})     
view.leading.constraint(equalTo: anchor, constant: inset)
#### leadingOf(anchorView, inset{0})    
view.leading.constraint(equalTo: anchorView.leading, constant: inset)
#### leadinggte(anchor, inset{0})    
view.leading.constraint(greaterThanOrEqualTo: anchor, constant: inset)
#### leadinglte(anchor, inset{0})       
view.leading.constraint(lessThanOrEqualTo: anchor, constant: inset)
#### trailing(anchor, inset{0})      
view.trailing.constraint(equalTo: anchor, constant: inset)
#### trailingOf(anchorView, inset{0})   
view.trailing.constraint(equalTo: anchorView.trailing, constant: inset)
#### trailinggte(anchor, inset{0})      
view.trailing.constraint(greaterThanOrEqualTo: anchor, constant: inset)
#### trailinglte(anchor, inset{0})      
view.trailing.constraint(lessThanOrEqualTo: anchor, constant: inset)
#### width(constant)      
view.width.constraint(equalToConstant: constant)
#### widthOf(anchorView, inset{0})      
view.width.constraint(equalTo: anchorView.width, constant: inset)
#### widthgte(constant)      
view.width.constraint(greaterThanOrEqualToConstant: constant)
#### widthlte(constant)       
view.width.constraint(lessThanOrEqualToConstant: constant)
#### height(constant)   
view.height.constraint(equalToConstant: constant)
#### heightOf(anchorView, inset{0})      
view.height.constraint(equalTo: anchorView.height, constant: inset)
#### heightgte(constant)      
view.height.constraint(greaterThanOrEqualToConstant: constant)
#### heightlte(constant)     
view.height.constraint(lessThanOrEqualToConstant: constant)
#### centerX(anchor, inset{0})         
view.centerX.constraint(equalTo: anchor, constant: inset)
#### centerXOf(anchorView, inset{0})    
view.centerX.constraint(equalTo: anchorView.centerX, constant: inset)
#### centerY(anchor, inset{0})    
view.centerY.constraint(equalTo: anchor, constant: inset)
#### centerYOf(anchorView, inset{0})    
view.centerY.constraint(equalTo: anchorView.centerY, constant: inset)
#### widthMultiple(dimension, multiple{1}, inset{0})
view.width.constraint(equalTo: dimension, multiplier: multiple, constant: inset)
#### heightMultiple(dimension, multiple{1}, inset{0})
view.height.constraint(equalTo: dimension, multiplier: multiple, constant: inset)
#### center(anchorView, x: xInset{0}, y: yInset{0})
view.centerX.constraint(equalTo: anchorView.centerX, constant: xInset)

  +

view.centerY.constraint(equalTo: anchorView.centerY, constant: yInset)



## Installation

UILab is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UILab'
```

## License

UILab is available under the MIT license. See the LICENSE file for more info.

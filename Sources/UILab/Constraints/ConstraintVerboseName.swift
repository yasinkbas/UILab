//
//  UILab
//
//  Created on 15.02.2020.
//  Using Swift 5.0
//

import UIKit

public extension UIView {
  var verboseName: String {
    get {
      guard let value = objc_getAssociatedObject(self, &AssociatedKeys.verboseState) as? String else {
        return .unknown
      }
      return value
    }
    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.verboseState, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      constraints.last?.identifier = "\(newValue).\(String(describing: constraints.last?.firstAttribute))"
    }
  }
}

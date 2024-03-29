//
//  UILab
//
//  Created on 18.02.2020.
//  Using Swift 5.0
//

import UIKit

extension Array where Element == Constraint {
  public var commit: Bool {
    get {
      guard let value = objc_getAssociatedObject(self, &AssociatedKeys.commitState) as? Bool else {
        return false
      }
      return value
    }
    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.commitState, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      newValue ? activate() : deactivate()
    }
  }

  internal func deactivate() {
    forEach { $0.isActive = false }
  }

  internal func activate() {
    Constraint.activate(self)
  }
}

public extension Array where Element == Constraint {
  var priority: Float {
    get {
      guard let value = objc_getAssociatedObject(self, &AssociatedKeys.priorityState) as? Float else {
        return first?.priority.rawValue ?? 1000
      }
      return value
    }

    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.priorityState, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      forEach { $0.priority = UILayoutPriority(newValue) }
    }
  }
}

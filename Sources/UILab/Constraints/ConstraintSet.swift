//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import UIKit

public extension UIView {
  @discardableResult
  func set(_ constraintList: ConstraintType..., commit: Bool = true, priority: Float = 1000) -> Constraints {
    translatesAutoresizingMaskIntoConstraints = false
    var constraints = Array(constraintList.map { $0.constraint(self) }.joined())
    constraints.forEach { ConstraintLog(verboseName: self.verboseName, messages: [.noMessage], constraint: $0).commit(.notice) }
    constraints.priority = priority
    constraints.commit = commit
    return constraints
  }

  @discardableResult
  func set(constraints: [ConstraintType], commit: Bool = true, priority: Float = 1000) -> Constraints {
    return Array(constraints.map { set($0, commit: commit, priority: priority) }.joined())
  }

  @discardableResult
  func set(commit: Bool = true, priority: Float = 1000, @ConstraintBuilder constraints: () -> [ConstraintType]) -> Constraints {
    set(constraints: constraints(), commit: commit, priority: priority)
  }

  subscript(_ constraintList: ConstraintType...) -> Constraints {
    set(constraints: constraintList, commit: false, priority: 1000)
  }
}

//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import UIKit

public extension UIView {
  @discardableResult
  func equalToSuper(with padding: Padding? = nil, commit: Bool = true, priority: Float = 1000) -> Constraints {
    guard let superview = superview else {
      ConstraintLog(verboseName: verboseName, messages: [.superviewNotFound], constraint: nil).commit(.error)
      return []
    }
    let constraints = activate(ConstraintWrapper(axises: Axises(superview), padding: padding, enableInsets: false), commit: commit, priority: priority)
    return constraints
  }
}

public extension UIView {
  @discardableResult
  func equalToSuper(_ directions: ConstraintDirection..., commit: Bool = true, priority: Float = 1000) -> Constraints {
    guard let superview = superview else {
      ConstraintLog(verboseName: verboseName, messages: [.superviewNotFound], constraint: nil).commit(.error)
      return []
    }
    var constraints = Constraints()
    translatesAutoresizingMaskIntoConstraints = false
    directions.forEach {
      switch $0 {
      case let .top(inset):
        constraints.append(self.topAnchor.constraint(equalTo: superview.topAnchor, constant: inset))

      case let .left(inset):
        constraints.append(self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: inset))

      case let .right(inset):
        constraints.append(self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -inset))

      case let .bottom(inset):
        constraints.append(self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset))

      case .width:
        constraints.append(self.widthAnchor.constraint(equalTo: superview.widthAnchor))

      case .height:
        constraints.append(self.heightAnchor.constraint(equalTo: superview.heightAnchor))
      }
    }

    constraints.priority = priority
    constraints.commit = commit
    return constraints
  }
}

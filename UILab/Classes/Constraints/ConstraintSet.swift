//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import UIKit

extension UIView {
    @discardableResult
    public func set(_ constraintList: ConstraintType..., commit: Bool = true, priority: Float = 1000) -> Constraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        var constraints = Array(constraintList.map { $0.constraint(self)}.joined())
        constraints.forEach { ConstraintLog(verboseName: self.verboseName, messages: [.noMessage], constraint: $0).commit(.notice) }
        constraints.priority = priority
        constraints.commit = commit
        return constraints
    }
    
    public func set(_ constraintList: [ConstraintType], commit: Bool = true, priority: Float = 1000) -> Constraints {
        var constraints = [Constraints]()
        constraintList.forEach{ constraints.append(set($0)) }
        return Array(constraints.joined())
    }
}


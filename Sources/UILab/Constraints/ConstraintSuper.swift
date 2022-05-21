//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import UIKit

extension UIView {
    @discardableResult
    public func equalToSuper(with padding: Padding? = nil, commit: Bool = true, priority: Float = 1000) -> Constraints {
        guard let superview = superview else {
            ConstraintLog(verboseName: self.verboseName, messages: [.superviewNotFound], constraint: nil).commit(.error)
            return []
        }
        let constraints = activate(ConstraintWrapper(axises: Axises(superview), padding: padding, enableInsets: false), commit: commit, priority: priority)
        return constraints
    }
}

extension UIView {
    @discardableResult
    public func equalToSuper(_ directions: ConstraintDirection..., commit: Bool = true, priority: Float = 1000) -> Constraints {
        guard let superview = superview else {
            ConstraintLog(verboseName: self.verboseName, messages: [.superviewNotFound], constraint: nil).commit(.error)
            return []
        }
        var constraints = Constraints()
        self.translatesAutoresizingMaskIntoConstraints = false
        directions.forEach{
            switch $0 {
            case .top(let inset):
                constraints.append(self.topAnchor.constraint(equalTo: superview.topAnchor, constant: inset))
                
            case.left(let inset):
                constraints.append(self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: inset))
                
            case .right(let inset):
                constraints.append(self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -inset))
                
            case .bottom(let inset):
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


//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import Foundation

extension UIView {
    public func equalToSuper(with padding: Padding? = nil, commit: Bool = true) -> Constraints {
        guard let superview = superview else {
            logger?.error(
                ConstraintLog(
                    verboseName: self.verboseName,
                    messages: [
                        .superviewNotFound
                    ], constraint: nil
                ), debug: debug
            )
            return []
        }
        return activate(ConstraintWrapper(axises: Axises(superview), padding: padding, enableInsets: false), commit: commit)
    }
}

extension UIView {    
    public func equalToSuper(_ directions: ConstraintDirectionType..., commit: Bool = true) -> Constraints {
        guard let superview = superview else {
            logger?.error(
                ConstraintLog(
                    verboseName: self.verboseName,
                    messages: [
                        .superviewNotFound
                    ], constraint: nil
                ), debug: debug
            )
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
        commit ? Constraint.activate(constraints) : nil
        return constraints
    }
}

// TODO: write a type that combines these types
public protocol Constraintable { }

extension UIView: Constraintable { }
extension NSLayoutConstraint: Constraintable { }


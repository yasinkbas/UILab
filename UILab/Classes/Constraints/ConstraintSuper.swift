//
//  UILab
//
//  Created on 10.02.2020.
//  Using Swift 5.0
//

import Foundation

extension UIView {
    public func equalToSuper(with padding: Padding? = nil) {
        if self.superview != nil {
            activate(ConstraintWrapper(axises: Axises(superview), padding: padding, enableInsets: false)
            )
        }
    }
}

extension UIView {    
    public func equalToSuper(_ directions: ConstraintDirectionType...) -> Constraints {
        guard let superview = superview else {
            logger?.error(
                ConstraintLog(
                    verboseName: self.verboseName,
                    messages: [.superviewNotFound],
                    constraint: nil
                ), debug: debug
            )
            return []
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        directions.forEach{
            switch $0 {
            case .top(let inset):
                self.topAnchor.constraint(equalTo: superview.topAnchor, constant: inset).isActive = true
                
            case.left(let inset):
                self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: inset).isActive = true
                
            case .right(let inset):
                self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -inset).isActive = true
                
            case .bottom(let inset):
                self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset).isActive = true
                
            case .width:
                self.widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
                
            case .height:
                self.heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
            }
        }
        
        return []
    }
}

// TODO: write a type that combines these types
public protocol Constraintable { }

extension UIView: Constraintable { }
extension NSLayoutConstraint: Constraintable { }


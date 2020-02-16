//
//  Constraints.swift
//  UILab
//
//  Created by Yasin Akbaş on 10.02.2020.
//

import Foundation

extension UIView {
    public func equalToSuper(with padding: Padding? = nil) {
        if self.superview != nil {
            activate(
                axises: Axises(superview),
                padding: padding,
                enableInsets: false
            )
        }
    }
}

extension UIView {    
    public func equalToSuper(_ directions: ConstraintDirectionType...) {
        guard let superview = superview else { return }
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
    }
}

// TODO: write a type then extension them in a type
public protocol Constraintable { }

extension UIView: Constraintable { }
extension NSLayoutConstraint: Constraintable { }


//
//  Constraints.swift
//  FBSnapshotTestCase
//
//  Created by Yasin Akbaş on 10.02.2020.
//

import Foundation

extension UIView {
    public func equalToSuper(with padding: Padding? = nil) {
        if let superview = self.superview {
            activate(
                top: superview.topAnchor,
                left: superview.leftAnchor,
                bottom: superview.bottomAnchor,
                right: superview.rightAnchor,
                paddingTop: padding?.top ?? 0,
                paddingLeft: padding?.left ?? 0,
                paddingBottom: padding?.bottom ?? 0,
                paddingRight: padding?.right ?? 0,
                enableInsets: false
            )
        }
    }
}

extension UIView {    
    public func equalToSuper(_ directions: DirectionType...) {
        guard let superview = superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        directions.forEach{
            switch $0 {
            case .top(let inset): self.topAnchor.constraint(equalTo: superview.topAnchor, constant: abs(inset)).isActive = true
            case.left(let inset): self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: abs(inset)).isActive = true
            case .right(let inset): self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -inset).isActive = true
            case .bottom(let inset): self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset).isActive = true
            case .width:  self.widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
            case .height: self.heightAnchor.constraint(equalTo: superview.heightAnchor).isActive = true
            }
        }
    }
}

// TODO: write a type then extension them in a type
public protocol Constraintable { }

extension UIView: Constraintable { }
extension NSLayoutConstraint: Constraintable { }


//
//  Constraints.swift
//  FBSnapshotTestCase
//
//  Created by Yasin Akbaş on 10.02.2020.
//b

extension UIView {    
    public func set(_ constraints: ConstraintType...) {
        self.translatesAutoresizingMaskIntoConstraints = false
        constraints.forEach{
            switch $0 {
            case .left(let anchor, let inset):
                self.leftAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .right(let anchor, let inset):
                self.rightAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
                
            case .top(let anchor, let inset):
                self.topAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .bottom(let anchor, let inset):
                self.bottomAnchor.constraint(equalTo: anchor, constant: -inset).isActive = true
                
            case .leading(let anchor, let inset):
                self.leading.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .trailing(let anchor, let inset):
                self.trailing.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .width(let width):
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
                
            case .height(let height):
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
                
            case .centerX(let anchor, let inset):
                self.centerXAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .centerY(let anchor, let inset):
                self.centerYAnchor.constraint(equalTo: anchor, constant: inset).isActive = true
                
            case .widthDimension(let dimension, let multiple, let inset):
                self.width.constraint(equalTo: dimension, multiplier: multiple, constant: inset).isActive = true
                
            case .heightDimension(let dimension, let multiple, let inset):
                self.height.constraint(equalTo: dimension, multiplier: multiple, constant: inset).isActive = true
                
            case .center(let view, x: let xInset, y: let yInset):
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xInset).isActive = true
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yInset).isActive = true
            }
        }
    }
    
    public func get(_ attribute: Attribute) -> Constraints {
        var constraints = [NSLayoutConstraint]()
        self.constraints.forEach { $0.firstAttribute == attribute ? constraints.append($0) : nil }
        return constraints
    }
}

